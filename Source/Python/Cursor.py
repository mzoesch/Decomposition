from typing import Any, Generator


class Cursor:
    """
    An iterator over the C source code that respects C syntax.
    """

    def __init__(self, content: str, line: int, column: int, end_line: int | None = None, end_column: int | None = None):
        """
        :param content:    The content to sweep over.
        :param line:       The line to start at. (Starts at one.)
        :param column:     The column to start at. (Starts at one.)
        :param end_line:   The end line or None to end at the end of the content.
        :param end_column: The end column or None to end at the end of the line (requires that #end_line is not None).
        """

        self.lines = content.splitlines()
        self.line = line
        self.column = column

        assert( self.line > 0 )
        assert( self.column > 0 )

        self.end_line = end_line
        self.end_column = end_column

        """ Whether we are inside a preprocessor directive. """
        self._in_pp: bool = False

        """ Whether we are inside a character literal. """
        self._in_char: bool = False

        """ Whether we are inside a string literal. """
        self._in_string: bool = False

        """ Whether we are inside a comment. """
        self._in_comment: bool = False

        """ Whether we are inside a multiline comment. """
        self._in_multiline_comment: bool = False

        self._is_escaped: bool = False
        self._last_char: str = ''
        self._last_last_char: str = ''

        return

    def __iter__(self) -> (str, bool):
        line, col = self.line, self.column

        def next_col() -> None:
            nonlocal line, col
            self._last_last_char = self._last_char
            self._last_char = self.lines[line-1][col-1]
            col += 1
            return None

        def next_line() -> None:
            nonlocal line, col
            self._last_last_char = self._last_char
            self._last_char = '\n'
            line += 1
            col = 1
            return None

        while line <= len(self.lines):
            if self.end_line is not None and self.end_line == line and self.end_column is None:
                return

            while col <= len(self.lines[line-1]):
                if self.end_line is not None and self.end_line == line and self.end_column is not None and self.end_column == col:
                    return

                c = self.lines[line-1][col-1]

                if self._in_pp:
                    yield c, False
                    next_col()
                    assert( self._is_escaped is False )
                    continue

                if self._in_comment:
                    yield c, False
                    next_col()
                    assert( self._is_escaped is False )
                    continue

                if self._in_multiline_comment:
                    yield c, False
                    if c == '/' and self._last_char == '*':
                        self._in_multiline_comment = False
                    next_col()
                    assert( self._is_escaped is False )
                    continue

                if self._in_char:
                    if c == '\'':
                        if self._last_char == '\\' and self._last_last_char == '\\':
                            self._in_char = False
                            yield c, True
                        elif self._last_char == '\\' and self._last_last_char != '\\':
                            yield c, False
                        else:
                            self._in_char = False
                            yield c, True
                        next_col()
                        continue
                    yield c, False
                    next_col()
                    continue

                if self._in_string:
                    if self._is_escaped:
                        self._is_escaped = False
                        yield c, False
                        next_col()
                        continue
                    if c == '\\':
                        self._is_escaped = True
                        yield c, False
                        next_col()
                        continue
                    if c == '"':
                        self._in_string = False
                        yield c, True
                        next_col()
                        continue
                    yield c, False
                    next_col()
                    continue

                if c == '\'':
                    assert( self._last_char != '\\' )
                    self._in_char = True
                    yield c, True
                    next_col()
                    continue

                if c == '"':
                    assert( self._last_char != '\\' )
                    self._in_string = True
                    yield c, True
                    next_col()
                    continue

                if c == '#':
                    yield c, True
                    self._in_pp = True
                    next_col()
                    continue

                if c == '/' and self._last_char == '/':
                    yield c, True
                    self._in_comment = True
                    next_col()
                    continue

                if c == '*' and self._last_char == '/':
                    yield c, True
                    self._in_multiline_comment = True
                    next_col()
                    continue

                yield c, True
                next_col()
                continue

            assert( self._is_escaped is False )
            assert( self._in_char is False )
            assert( self._in_string is False )

            if self._in_pp:
                if self._last_char == '\\' or (self._last_char == '\r' and self._last_last_char == '\\'):
                    yield '\n', False
                else:
                    self._in_pp = False
                    yield '\n', True
                next_line()
                continue

            if self._in_comment:
                yield '\n', True
                self._in_comment = False
                next_line()
                continue

            yield '\n', True
            next_line()
            continue

        return

    def iter(self):
        return self.__iter__()

    def iter_not_syntax(self) -> Generator[str, Any, None]:
        line, col = self.line, self.column
        while line < len(self.lines):
            if self.end_line is not None and self.end_line == line and self.end_column is None:
                return

            while col <= len(self.lines[line-1]):
                if self.end_line is not None and self.end_line == line and self.end_column is not None and self.end_column == col:
                    return

                c = self.lines[line-1][col-1]
                yield c
                col += 1
                continue

            yield '\n'
            line += 1
            col = 1
            continue

        return
