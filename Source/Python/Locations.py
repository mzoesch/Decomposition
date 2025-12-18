from Source.Python.SqlConnection import SqlConnection


class SourceFile:
    """
    Represents a source file in the original project.
    """

    def __init__(self, ident: str):
        assert ident != ''
        self.ident = ident

    def __eq__(self, other):
        if not isinstance(other, SourceFile):
            return NotImplemented
        return self.ident == other.ident

    def __hash__(self):
        return hash(self.ident)


class SourceLocation:
    """
    Represents a specific location in a source file.
    """

    def __init__(self, file: SourceFile, line: int, column: int):
        assert file is not None

        self.file = file
        self.line = line
        self.column = column

    def is_line_valid(self) -> bool:
        return self.line > 0

    def is_column_valid(self) -> bool:
        return self.column > 0

    def is_translation(self) -> bool:
        return is_source_translation(self.file.ident, None)

    def is_header(self) -> bool:
        return not self.is_translation()

    def __eq__(self, other):
        if not isinstance(other, SourceLocation):
            return NotImplemented
        return (self.file == other.file and
                self.line == other.line and
                self.column == other.column)

    def is_less(self, other) -> bool:
        if not isinstance(other, SourceLocation):
            return NotImplemented
        if self.file != other.file:
            return NotImplemented
        if self.line != other.line:
            return self.line < other.line
        return self.column <= other.column

    def has_covered(self, other) -> bool:
        if not isinstance(other, SourceLocation):
            return NotImplemented
        if self.file != other.file:
            return False
        if self.line > other.line:
            return False
        if self.line == other.line and self.column > other.column:
            return False

        return True


def is_source_translation(f: str, con: SqlConnection) -> bool: # TODO Use the extensions form the database.
    return f.endswith('.c')
