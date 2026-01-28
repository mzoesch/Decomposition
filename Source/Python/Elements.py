import hashlib
import warnings
from Source.Python.Globals import Globals
from Source.Python.Cursor import Cursor
from Source.Python.Locations import SourceLocation, is_source_translation
from Source.Python.SqlConnection import SqlConnection
from Source.Python.Utility import starts_content_with_qualified_type


class UnitElement:
    """
    High level representation of an element that resides inside a unit.
    """

    def __init__(self, ident: str | None, source: SourceLocation, rsource: SourceLocation | None = None):
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

    def get_human_readable_display_name(self) -> str:
        return self.ident

    def is_rsource_valid(self) -> bool:
        return self.rsource is not None

    def is_content_valid(self) -> bool:
        return self.content is not None

    def is_source_translation(self) -> bool:
        return self.source.is_translation()

    def is_source_header(self) -> bool:
        return self.source.is_header()

    @warnings.deprecated("Use is_impl_file")
    def is_translation(self, g: Globals) -> bool:
        return self.is_impl_file(g)

    def is_impl_file(self, g: Globals) -> bool:
        assert False

    def is_header(self, g: Globals) -> bool:
        return not self.is_impl_file(g)

    def get_forward_declaration(self, g: Globals, target: str) -> str | None:
        assert False

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        self.decl_doc = ''
        self.content = ''

        self._cache_decl_content(g, con)

        return None

    def get_flat_refs(self) -> set[str]:
        out = set()
        for r in self.var_refs:
            out.add(r)
        for r in self.record_refs:
            out.add(r)
        return out

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


class UnitWrap(UnitElement):
    """
    Represents tightly coupled elements in the original project.
    """

    def __init__(self, subs: list[UnitElement]):
        assert len(subs) > 1
        source = subs[0].source

        for unit_elem in subs:
            assert unit_elem.source == source

        rsource = subs[0].rsource
        assert rsource is not None
        for unit_elem in subs:
            assert unit_elem.rsource is not None
            if not unit_elem.rsource.is_less(rsource):
                rsource = unit_elem.rsource
            continue

        super().__init__(None, source, rsource)

        self.subs: list[UnitElement] = subs

    def get_human_readable_display_name(self) -> str:
        idents = [sub.get_human_readable_display_name() for sub in self.subs]
        return ', '.join(idents)

    def is_impl_file(self, g: Globals) -> bool:
        assert len(self.subs) > 1
        return self.subs[0].is_impl_file(g)

    def get_forward_declaration(self, g: Globals, target: str) -> str | None:
        fwds: str = ''
        for sub in self.subs:
            fwd = sub.get_forward_declaration(g, target)
            if fwd is not None:
                fwds += fwd + '\n'
            else:
                if sub.get_human_readable_display_name() == target:
                    return None
            continue

        if fwds == '':
            return None

        return fwds

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line, self.source.column,
            self.rsource.line, self.rsource.column + 1
            )

        self.content += cursor.get_default_itered_no_syntax()
        self.content += ';'

        return None

    def update_refs(self, g: Globals, con: SqlConnection) -> None:
        assert len(self.subs) > 1

        if self.record_refs is not None:
            assert self.var_refs is not None
            return None

        for s in self.subs:
            s.update_refs(g, con)
            continue

        self.record_refs = {}
        self.var_refs = set()

        for s in self.subs:
            assert s.record_refs is not None
            assert s.var_refs is not None

            for record, strong in s.record_refs.items():
                if strong:
                    self.record_refs[record] = strong
                elif record not in self.record_refs:
                    self.record_refs[record] = strong
                continue

            for var in s.var_refs:
                self.var_refs.add(var)
            continue

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

    def is_impl_file(self, g: Globals) -> bool:
        return False

    def get_forward_declaration(self, g: Globals, target: str) -> str | None:
        assert self.ty == 'struct' or self.ty == 'union' or self.ty == 'enum'

        if self.ident.startswith('<'):
            return None

        return f'{self.ident};'

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line, self.source.column,
            self.rsource.line, self.rsource.column + 1
            )

        # if (not self.kw_ppp) and (self.ident.startswith('<') is False):
        #     self.content += f'{self.ty} '

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

    def __init__(self, ident: str, source: SourceLocation, rsource: SourceLocation,
         tag_record: str | None, ostream: str | None):
        super().__init__(ident, source, rsource)

        self.tag_record: str | None = tag_record
        self.ostream: str | None = ostream

    def is_impl_file(self, g: Globals) -> bool:
        return False

    def get_forward_declaration(self, g: Globals, _: str) -> str | None:
        if self.tag_record is not None:
            return f'typedef {self.tag_record} {self.ident};'
        elif self.ostream is not None:
            return f'typedef {self.ostream};'
        else:
            return None

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line, self.source.column,
            self.rsource.line, self.rsource.column
            )

        self.content += cursor.get_default_itered_no_syntax()
        # self.content += self.ident
        # self.content += ';'

        return None


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

    def is_impl_file(self, g: Globals) -> bool:
        if g.args.ImplInHeader:
            return True
        if self.static:
            return self.is_source_translation()
        return True

    def is_static(self) -> bool:
        return self.static

    def is_extern(self) -> bool:
        return self.extern

    def get_forward_declaration(self, g: Globals, _: str) -> str:
        out: str = ''
        # if g.args.RespectStatic and self.is_static():
        #     out += 'static '
        # elif self.is_extern():
        #     out += 'extern '

        if self.ty.endswith(']'):
            out += f'extern {self.ty[:self.ty.index('[')]} {self.ident}{self.ty[self.ty.index('['):]};'
        else:
            out += f'extern {self._get_type_decl(g)} {self.ident};'

        return out

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        super().cache_content(g, con)

        if g.args.RespectStatic and self.is_static():
            self.content += 'static '

        if self.init is None:
            self.content += f'{self._get_type_decl(g)} {self.ident};'
        else:
            if self.ty.endswith(']'):
                self.content += f'{self.ty[:self.ty.index('[')]} {self.ident}{self.ty[self.ty.index('['):]} = {self.init};'
            else:
                self.content += f'{self._get_type_decl(g)} {self.ident} = {self.init};'
        return None

    def _get_type_decl(self, g: Globals) -> str:
        if (   self.ty.startswith('struct (unnamed struct at ')
            or self.ty.startswith('union (unnamed union at ')
            or self.ty.startswith('enum (unnamed enum at ')
            ):
            start_index = self.ty.rfind(':')
            column = int(self.ty[start_index + 1:self.ty.rfind(')')])
            line = int(self.ty[self.ty.rfind(':', 0, start_index) + 1:start_index])

            cursor: Cursor = Cursor(
                g.args,
                _get_file_content(self.source.file.ident),
                line, column,
                self.source.line, self.source.column
                )

            ty_str = ''
            for c in cursor.iter_no_syntax():
                if c is None:
                    ty_str = ty_str[:-1]
                    continue

                ty_str += c
                continue

            if ty_str.endswith(' '):
                ty_str = ty_str[:-1]

            return ty_str

        return self.ty


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

    def is_impl_file(self, g: Globals) -> bool:
        if g.args.ImplInHeader:
            return True
        if self.static:
            return self.is_source_translation()
        return True

    def is_static(self) -> bool:
        return self.static

    def get_forward_declaration(self, g: Globals, _: str) -> str | None:
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

        if self.ret.startswith('const '):
            unqualified_ret = self.ret[6:]

            _content = cursor.get_default_itered_no_syntax()
            if starts_content_with_qualified_type(_content, unqualified_ret):
                _content = 'const ' + _content
            self.content += _content
        else:
            self.content += cursor.get_default_itered_no_syntax()

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
