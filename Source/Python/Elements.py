import hashlib
from Source.Python.Globals import Globals
from Source.Python.Cursor import Cursor
from Source.Python.Locations import SourceLocation, is_source_translation
from Source.Python.SqlConnection import SqlConnection


class UnitElement:
    """
    High level representation of an element that resides inside a unit.
    """

    def __init__(self, ident: str, source: SourceLocation, rsource: SourceLocation | None = None):
        assert ident != ''
        assert source is not None

        self.ident = ident
        self.source = source
        self.rsource = rsource

        self.decl_doc: str | None = None
        self.content: str | None = None

        self.decl_doc_n: int = 0
        self.content_n: int = 0

        self.record_refs: dict[str, bool] | None = None
        self.var_refs: set[str] | None = None

    def is_rsource_valid(self) -> bool:
        return self.rsource is not None

    def is_content_valid(self) -> bool:
        return self.content is not None

    def is_source_translation(self) -> bool:
        return self.source.is_translation()

    def is_source_header(self) -> bool:
        return self.source.is_header()

    def is_translation(self, g: Globals) -> bool:
        assert False

    def is_header(self, g: Globals) -> bool:
        return not self.is_translation(g)

    def get_forward_declaration(self, g: Globals) -> str | None:
        assert False

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        self.decl_doc = ''
        self.content = ''

        self._cache_decl_content(g, con)

        return None

    def update_n(self, g: Globals) -> None:
        assert self.decl_doc is not None
        assert self.content is not None

        self.decl_doc_n = sum((not c.isspace()) for c in self.decl_doc)

        if g.args.CountDocsToN is False:
            self.content_n = 0
            cursor: Cursor = Cursor(g.args, self.content)
            for c, valid in cursor.iter():
                if c is None:
                    self.content_n -= 1
                    continue

                if valid is False:
                    continue

                if c.isspace() is False:
                    self.content_n += 1
                continue

            self.content_n = max(self.content_n, 0)
        else:
            self.content_n = sum((not c.isspace()) for c in self.content)

        return None

    def update_refs(self, g: Globals, con: SqlConnection) -> None:
        if self.record_refs is not None:
            assert self.var_refs is not None
            return None

        self.record_refs = {}
        self.var_refs = set()

        con.execute_ro("""
        SELECT Type, Ref, bStrong FROM Refs
        WHERE Source = ? AND Identifier = ?
        """, (self.source.file.ident, self.ident)
        )

        rows = con.fetchall()
        for t, r, s in rows:
            s = bool(s)

            if t == 'record':
                if r not in self.record_refs:
                    self.record_refs[r] = s
                elif s:
                    self.record_refs[r] = True
            elif t == 'variable':
                self.var_refs.add(r)
            else:
                assert False

            continue

        return None

    def _cache_decl_content(self, g: Globals, con: SqlConnection) -> None:
        decl = _get_decl_content(self, g, con)
        if decl is not None:
            self.decl_doc = decl
        return None


class UnitRecord(UnitElement):
    """
    Represents a record in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, rsource: SourceLocation, ty: str, enum: str | None):
        assert rsource is not None
        assert (ty is not None) and ty != ''
        assert enum is None or enum != ''

        super().__init__(ident, source, rsource)

        self.ty: str = ty
        self.enum: str | None = enum

    def is_translation(self, g: Globals) -> bool:
        return False

    def get_forward_declaration(self, g: Globals) -> str | None:
        assert self.ty == 'struct' or self.ty == 'union' or self.ty == 'enum'
        return f'{self.ident};'

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line,
            self.source.column,
            self.rsource.line,
            self.rsource.column + 1
            )

        self.content += f'{self.ty} '

        for c in cursor.iter_no_syntax():
            if c is None:
                self.content = self.content[:-1]
                continue

            self.content += c
            continue

        if self.content[-1] != ';':
            self.content += ';'

        return None


class UnitTypedef(UnitElement):
    """
    Represents a typedef in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, what: str | None, ty: str | None,
                 no_tag: bool, no_tag_line: int | None, no_tag_column: int | None, r_no_tag_line: int, r_no_tag_column: int):
        super().__init__(ident, source)

        self.what = what
        self.ty = ty
        self.no_tag = no_tag

        self.no_tag_line = no_tag_line
        self.no_tag_column = no_tag_column
        self.r_no_tag_line = r_no_tag_line
        self.r_no_tag_column = r_no_tag_column

        if self.no_tag_line:
            assert self.no_tag_column
            assert self.r_no_tag_line
            assert self.r_no_tag_column

        if self.is_no_tag():
            assert (self.no_tag_line is not None) and (self.no_tag_column is not None)
            assert (self.r_no_tag_line is not None) and (self.r_no_tag_column is not None)

    def is_translation(self, g: Globals) -> bool:
        return False

    def is_no_tag(self) -> bool:
        return self.no_tag

    def get_forward_declaration(self, g: Globals) -> str | None:
        if self.is_no_tag():
            return f'typedef {self.ty} {self.get_no_tag_name()} {self.ident};'
        else:
            return f'typedef {self.what};'

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        if self.is_no_tag():
            self.finalize_content_not_tagged(g)
        else:
            self.finalize_content_tagged()

        return None

    def finalize_content_tagged(self) -> None:
        self.content += f'typedef {self.what};'
        return None

    def finalize_content_not_tagged(self, g: Globals) -> None:
        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.no_tag_line,
            self.no_tag_column,
            self.r_no_tag_line,
            self.r_no_tag_column + 1
            )

        self.content += 'typedef '
        for c in cursor.iter_no_syntax():
            if c is None:
                self.content = self.content[:-1]
                continue
            self.content += c
            continue
        self.content += self.ident
        self.content += ';'

        ty_index = self.content.find(self.ty)
        if ty_index != -1:
            ty_index += len(self.ty)
            self.content = self.content[:ty_index] + ' ' + self.get_no_tag_name() + self.content[ty_index:]


        return None

    def get_no_tag_name(self) -> str:
        assert self.is_no_tag()
        hasher = hashlib.sha256()
        hasher.update(self.ident.encode('utf-8'))
        hasher.update(self.ty.encode('utf-8'))
        hasher.update(self.source.file.ident.encode('utf-8'))

        return f'__no_tag_{hasher.hexdigest()[:16]}'


class UnitVariable(UnitElement):
    """
    Represents a variable in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, ty: str, static: bool, extern: bool, init: str | None):
        super().__init__(ident, source)

        self.ty: str = ty
        self.static: bool = static
        self.extern: bool = extern
        self.init: str | None = init

    def is_translation(self, g: Globals) -> bool:
        if g.args.ImplInHeader:
            return True
        if self.static:
            return self.is_source_translation()
        return True

    def is_static(self) -> bool:
        return self.static

    def is_extern(self) -> bool:
        return self.extern

    def get_forward_declaration(self, g: Globals) -> str:
        out: str = ''
        # if g.args.RespectStatic and self.is_static():
        #     out += 'static '
        # elif self.is_extern():
        #     out += 'extern '

        if self.ty.endswith(']'):
            out += f'extern {self.ty[:self.ty.index('[')]} {self.ident}{self.ty[self.ty.index('['):]};'
        else:
            out += f'extern {self.ty} {self.ident};'

        return out

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        if g.args.RespectStatic and self.is_static():
            self.content += 'static '

        if self.init is None:
            self.content += f'{self.ty} {self.ident};'
        else:
            if self.ty.endswith(']'):
                self.content += f'{self.ty[:self.ty.index('[')]} {self.ident}{self.ty[self.ty.index('['):]} = {self.init};'
            else:
                self.content += f'{self.ty} {self.ident} = {self.init};'
        return None


class UnitFunction(UnitElement):
    """
    Represents a function in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, rsource: SourceLocation, params: str, static: bool, ret: str):
        assert rsource is not None
        super().__init__(ident, source, rsource)

        self.params: str = params
        self.static: bool = static
        self.ret: str = ret

    def is_translation(self, g: Globals) -> bool:
        if g.args.ImplInHeader:
            return True
        if self.static:
            return self.is_source_translation()
        return True

    def is_static(self) -> bool:
        return self.static

    def get_forward_declaration(self, g: Globals) -> str | None:
        return f'{self.ret} {self.ident}({self.params});'

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line,
            self.source.column,
            self.rsource.line,
            self.rsource.column + 1
            )

        if g.args.RespectStatic and self.is_static():
            self.content += 'static '

        self.content += f'{self.ret} '

        for c in cursor.iter_no_syntax():
            if c is None:
                self.content = self.content[:-1]
                continue

            self.content += c
            continue

        if self.content[-1] != '}':
            self.content += '}'

        return None


_file_content_cache: dict[str, str] = {}
def _get_file_content(file_path) -> str:
    entry = _file_content_cache.get(file_path)
    if entry is not None:
        return entry

    with open(file_path, 'r') as f:
        content = f.read()
        _file_content_cache[file_path] = content
        return content


def _get_decl_content(e: UnitElement, g: Globals, con: SqlConnection) -> str | None:
    con.execute_ro('''
        SELECT Source, Line, "Column", bStatic, bDef FROM Decls
        WHERE Identifier = ?
        ''', (e.ident,)
        )

    rows = con.fetchall()

    row_definition = None
    sorted_rows = []
    for source, line, column, static, definition in rows:
        static = bool(static)
        definition = bool(definition)
        if definition:
            row_definition = (source, line, column, static, definition)
            continue

        if static and is_source_translation(source, con):
            if source != e.source.file.ident:
                # Unrelated static declarations in another translation unit.
                continue

        sorted_rows.append((source, line, column, static, definition))

        continue

    if row_definition is not None:
        sorted_rows = [row_definition] + sorted_rows
        row_definition = None

    return _get_decl_content_from_sorted_rows(g, con, sorted_rows)


def _get_decl_content_from_sorted_rows(g: Globals, con: SqlConnection, rows) -> str | None:
    for r in rows:
        doc = _get_decl_content_from_sorted_row(g, con, r)
        if doc is None:
            continue

        source, _, _, _, _ = r
        f_content = _get_file_content(source)

        cursor: Cursor = Cursor(
            g.args,
            f_content,
            doc[0], doc[1],
            doc[2], doc[3]
            )

        decl_doc = ''
        for c in cursor.iter_no_syntax():
            if c is None:
                decl_doc = decl_doc[:-1]
                continue

            decl_doc += c
            continue

        return decl_doc

    return None


def _get_decl_content_from_sorted_row(g: Globals, con: SqlConnection, row) -> (
    tuple[ # Returns a tuple if a decl doc is found.
        int, # One-based start line
        int, # One-based start column
        int, # One-based end line
        int  # One-based end column
    ]
    | None # Returns None if no decl doc is found.
    ):

    source, line, column, _, _ = row

    line = line - 1 # Zero-based line
    column = column - 1 # Zero-based column

    f_content = _get_file_content(source)
    f_lines: list[str] = f_content.splitlines()

    in_line: int = line
    in_column: int = column

    # The number of grace lines we give. Else we give up.
    in_grace: int = 1

    grace: int = in_grace

    # Whether we are ok.
    ok: bool = False

    # Whether we are inside a multiline comment that behaves like a decl doc.
    is_multiline_comment: bool = False
    # One-based line and column.
    end_multiline_comment_line: int | None = None
    end_multiline_comment_column: int | None = None
    end_comment_line: int | None = None

    # One-based line and column.
    start_line: int | None = None
    start_column: int | None = None

    in_multiline_comment: bool = False

    last_char: str = ''

    def prev_column() -> None:
        nonlocal column
        nonlocal last_char

        last_char = c
        column -= 1

        return None

    while grace >= 0 or in_multiline_comment:
        if column < 0:
            line -= 1
            if line < 0:
                return None
            column = len(f_lines[line]) - 1
            grace -= 1

            continue

        if line < 0:
            return None

        c: str = f_lines[line][column]

        if in_multiline_comment:
            if c == '/' and last_char == '*':
                is_multiline_comment = True
                ok = True
                start_line = line + 1
                start_column = column + 1

                break

            else:
                prev_column()
                continue

        if c == '*' and last_char == '/':
            in_multiline_comment = True
            end_multiline_comment_line = (
                line
                + 1 # One-based line
                )
            end_multiline_comment_column = (
                column
                + 1 # One-based column
                + 2 # For the '*/'
                )
            grace = 0

            prev_column()
            continue

        prev_column()
        continue

    if not ok:
        assert (start_line is None) and (start_column is None)

        # Search for non multiline comments.
        line = in_line + 1
        column = in_column
        grace = in_grace

        while grace >= 0:
            line -= 1

            if line < 0:
                if end_comment_line is not None:
                    ok = True
                    start_line = 1
                    start_column = 1
                break

            current_line_str = f_lines[line]
            current_line_str = current_line_str.lstrip()

            if current_line_str.startswith('//'):
                if end_comment_line is None:
                    end_comment_line = line + 1
                continue

            if end_comment_line is None:
                grace -= 1
                continue

            # We have reached the end of the single line comment over multiple lines.
            ok = True
            start_line = (
                line
                + 1 # One-based line
                + 1 # Because we searched one above the line we are on
                )
            start_column = 1

            break

    if ok:
        assert (start_line is not None) and (start_column is not None)

        if is_multiline_comment:
            assert (
                (end_multiline_comment_line is not None)
                and (end_multiline_comment_column is not None)
                )
            return (
                start_line, start_column,
                end_multiline_comment_line, end_multiline_comment_column
                )
        else:
            assert (end_comment_line is not None)
            return (
                start_line, start_column,
                end_comment_line, len(f_lines[end_comment_line - 1])
                + 1 # One-based column
                )
    else:
        return None
