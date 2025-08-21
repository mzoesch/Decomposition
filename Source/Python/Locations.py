class SourceFile:
    """
    Represents a source file in the original project.
    """

    def __init__(self, ident: str):
        assert ident != ''
        self.ident = ident


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
        return self.file.ident.endswith('.c') # TODO Use the extensions form the database.

    def is_header(self) -> bool:
        return not self.is_translation()
