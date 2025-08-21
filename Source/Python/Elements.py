from Source.Python.Globals import Globals
from Source.Python.Cursor import Cursor
from Source.Python.Locations import SourceLocation
from Source.Python.SqlConnection import SqlConnection


class UnitElement:
    """
    High level representation of an element that resides inside a unit.
    """

    def __init__(self, ident: str, source: SourceLocation):
        assert ident != ''
        assert source is not None

        self.ident = ident
        self.source = source

        self.decl_doc: str | None = None
        self.content: str | None = None

    def is_content_valid(self) -> bool:
        return self.content is not None

    def is_source_translation(self) -> bool:
        return self.source.is_translation()

    def is_source_header(self) -> bool:
        return self.source.is_header()

    def is_translation(self) -> bool:
        assert False

    def is_header(self):
        return not self.is_translation()

    def get_forward_declaration(self, g: Globals) -> str:
        assert False

    def finalize_content(self, g: Globals, con: SqlConnection) -> None:
        self.decl_doc = ''
        self.content = ''
        return None


class UnitRecord(UnitElement):
    """
    Represents a record in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, ty: str, enum: str | None):
        assert (ty is not None) and ty != ''
        assert enum is None or enum != ''

        super().__init__(ident, source)

        self.ty: str = ty
        self.enum: str | None = enum

    def is_translation(self) -> bool:
        return False

    def finalize_content(self, g: Globals, con: SqlConnection) -> None:
        super().finalize_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line,
            self.source.column
            )

        self.content += f'{self.ty} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if c is None:
                self.content = self.content[:-1]
                continue

            if valid is False:
                self.content += c
                continue

            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            self.content += c

            if curly_open == 0 and c == '}':
                self.content += ';'
                break
            continue

        return None


class UnitTypedef(UnitElement):
    """
    Represents a typedef in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, what: str | None, ty: str | None,
                 anonymous: bool, anonymous_begin_line: int | None, anonymous_begin_column: int| None):
        super().__init__(ident, source)

        self.what = what
        self.ty = ty
        self.anonymous = anonymous
        self.anonymous_begin_line = anonymous_begin_line
        self.anonymous_begin_column = anonymous_begin_column

        if self.is_anonymous():
            assert (self.anonymous_begin_line is not None) and (self.anonymous_begin_column is not None)

    def is_translation(self) -> bool:
        return False

    def is_anonymous(self) -> bool:
        return self.anonymous

    def finalize_content(self, g: Globals, con: SqlConnection) -> None:
        super().finalize_content(g, con)

        if self.is_anonymous():
            self.finalize_content_anonymous(g)
        else:
            self.finalize_content_tagged()

        return None

    def finalize_content_tagged(self) -> None:
        self.content += f'typedef {self.what};'
        return None

    def finalize_content_anonymous(self, g: Globals) -> None:
        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.anonymous_begin_line,
            self.anonymous_begin_column,
            self.source.line,
            self.source.column
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

        return None


class UnitVariable(UnitElement):
    """
    Represents a variable in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, ty: str, static: bool, extern: bool):
        super().__init__(ident, source)

        self.ty: str = ty
        self.static: bool = static
        self.extern: bool = extern

    def is_translation(self) -> bool:
        return self.is_source_translation()

    def is_static(self) -> bool:
        return self.static

    def is_extern(self) -> bool:
        return self.extern

    def get_forward_declaration(self, g: Globals) -> str:
        out: str = ''
        if g.args.RespectStatic and self.is_static():
            out += 'static '
        elif self.is_extern():
            out += 'extern '
        out += f'{self.ty} {self.ident};'
        return out

    def finalize_content(self, g: Globals, con: SqlConnection) -> None:
        super().finalize_content(g, con)

        if g.args.RespectStatic and self.is_static():
            self.content += 'static '

        self.content += f'{self.ty} {self.ident};'
        return None


class UnitFunction(UnitElement):
    """
    Represents a function in the original project.
    """

    def __init__(self, ident: str, source: SourceLocation, params: str, static: bool, ret: str):
        super().__init__(ident, source)

        self.params: str = params
        self.static: bool = static
        self.ret: str = ret

    def is_translation(self) -> bool:
        return self.is_source_translation()

    def is_static(self) -> bool:
        return self.static

    def get_forward_declaration(self, g: Globals) -> str:
        return f'{self.ret} {self.ident}({self.params});'

    def finalize_content(self, g: Globals, con: SqlConnection) -> None:
        super().finalize_content(g, con)

        cursor: Cursor = Cursor(
            g.args,
            _get_file_content(self.source.file.ident),
            self.source.line,
            self.source.column
            )

        if g.args.RespectStatic and self.is_static():
            self.content += 'static '#

        self.content += f'{self.ret} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if c is None:
                self.content = self.content[:-1]
                continue

            if valid is False:
                self.content += c
                continue

            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            self.content += c

            if curly_open == 0 and c == '}':
                self.content += ';'
                break
            continue

        return None


def _get_file_content(file_path) -> str:
    with open(file_path, 'r') as c_file:
        content = c_file.read()
        return content
