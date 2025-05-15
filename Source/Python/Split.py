import os
import json
from Source.Python.Exporter import Exporter, Symbol, SymbolReference, SourceCodeLocation
from Source.Python.Types import ESymbolType


exporter: Exporter | None = None


def split_impl(args) -> None:
    global exporter
    exporter = Exporter(args)

    with open(exporter.get_intermediate_file(), 'r') as f:
        ir = json.load(f)

    _export_records(args, ir)
    _export_typedefs(args, ir)
    _export_functions(args, ir)

    exporter.export(ir)

    return None


class Cursor:
    """
    An iterator over the C source code that respects C syntax.
    """

    def __init__(self, content: str, line: int, column: int, end_line: int | None = None, end_column: int | None = None):
        self.lines = content.splitlines()
        self.line = line
        self.column = column

        self.end_line = end_line
        self.end_column = end_column

        self._in_define: bool = False
        self._in_char: bool = False
        self._in_string: bool = False
        self._in_comment: bool = False
        self._in_multiline_comment: bool = False

        self._last_char: str = ''
        self._last_last_char: str = ''

        return

    def __iter__(self) -> (str, bool):

        line, col = self.line, self.column

        while line < len(self.lines):
            if self.end_line is not None and self.end_line == line and self.end_column is None:
                return

            while col <= len(self.lines[line-1]):
                if self.end_line is not None and self.end_line == line and self.end_column is not None and self.end_column == col:
                    return

                c = self.lines[line-1][col-1]

                if self._in_define:
                    yield c, False
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if self._in_comment:
                    yield c, False
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if self._in_multiline_comment:
                    yield c, False
                    if c == '/' and self._last_char == '*':
                        self._in_multiline_comment = False
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if c == '\'' and self._last_char != '\\':
                    yield c, True
                    if self._in_char:
                        self._in_char = False
                        self._last_last_char = self._last_char
                        self._last_char = c
                        col += 1
                        continue
                    self._in_char = True
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if self._in_char:
                    yield c, False
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if c == '"' and self._last_char != '\\':
                    if self._in_string:
                        yield c, True
                        self._in_string = False
                        self._last_last_char = self._last_char
                        self._last_char = c
                        col += 1
                        continue
                    yield c, True
                    self._in_string = True
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if self._in_string:
                    yield c, False
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if c == '#':
                    yield c, False
                    if self.lines[line-1][col:] == '#define':
                        self._in_define = True
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if c == '/' and self._last_char == '/':
                    yield c, False
                    self._in_comment = True
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                if c == '*' and self._last_char == '/':
                    yield c, False
                    self._in_multiline_comment = True
                    self._last_last_char = self._last_char
                    self._last_char = c
                    col += 1
                    continue

                yield c, True
                self._last_last_char = self._last_char
                self._last_char = c
                col += 1
                continue

            if self._in_define:
                if self._last_char == '\\' or (self._last_char == '\r' and self._last_last_char == '\\'):
                    yield '\n', False
                    self._last_last_char = self._last_char
                    self._last_char = '\n'
                    line += 1
                    col = 1
                    continue
                self._in_define = False
                yield '\n', False
                self._last_last_char = self._last_char
                self._last_char = '\n'
                line += 1
                col = 1
                continue

            if self._in_comment:
                yield '\n', False
                self._in_comment = False
                self._last_last_char = self._last_char
                self._last_char = '\n'
                line += 1
                col = 1
                continue

            yield '\n', True
            self._last_last_char = self._last_char
            self._last_char = '\n'
            line += 1
            col = 1
            continue

        return

    def iter(self):
        return self.__iter__()

    def iter_not_syntax(self) -> str:
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

def _get_file_content(file_path) -> str:
    with open(file_path, 'r') as c_file:
        content = c_file.read()
        return content


def _export_records(args, ir) -> None:
    for r in ir['Records']:
        content = ''
        cursor = Cursor(_get_file_content(r['Source']), r['Line'], r['Column'])

        content += f'{r['Type']} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if valid is False:
                content += c
                continue
            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            content += c
            if curly_open == 0 and c == '}':
                content += ';'
                break
            continue

        symbol: Symbol = Symbol(
            ESymbolType.RECORD,
            r['Identifier'],
            content,
            SourceCodeLocation(r['Source'], r['Line'], r['Column']),
            None,
            r,
            )
        for record in r['Records']:
            symbol.add_reference(record['Identifier'])

        exporter.add_symbol(symbol)
        continue

    return None


def _export_typedefs(args, ir) -> None:
    for td in ir['Typedefs']:
        if td['Complex']:
            content = 'typedef '
            cursor = Cursor(
                _get_file_content(td['Source']),
                td['ComplexBeginLine'], td['ComplexBeginColumn'],
                td['Line'], td['Column'],
                )
            for c in cursor.iter_not_syntax():
                content += c

            content += f'{td['Identifier']};'

            refs: list[SymbolReference] = []
            if td.get('ComplexTypeDecl') is not None:
                for ref in td['ComplexTypeDecl']['Records']:
                    refs.append(SymbolReference(ref['Identifier']))

            symbol: Symbol = Symbol(
                ESymbolType.RECORD,
                td['Identifier'],
                content,
                SourceCodeLocation(td['Source'], td['Line'], td['Column']),
                refs,
                )
        else:
            symbol: Symbol = Symbol(
                ESymbolType.RECORD,
                td['Identifier'],
                f'typedef {td['What']};',
                SourceCodeLocation(td['Source'], td['Line'], td['Column']),
                )

        if not td['Type'] is None:
            symbol.add_reference(td['Type'])

        exporter.add_symbol(symbol)
        continue

    return None


def _export_functions(args, it) -> None:
    for f in it['Functions']:
        content = ''
        cursor = Cursor(_get_file_content(f['Source']), f['Line'], f['Column'])

        # TODO Solve the static problem later on...
        # if f['bStatic']:
        #     content += 'static '
        content += f'{f['Ret']} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if valid is False:
                content += c
                continue
            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            content += c
            if curly_open == 0 and c == '}':
                content += ';'
                break
            continue

        symbol: Symbol = Symbol(
            ESymbolType.FUNCTION,
            f['Identifier'],
            content,
            SourceCodeLocation(f['Source'], f['Line'], f['Column']),
            None,
            f,
            )

        for callee in f['Callees']:
            symbol.add_reference(callee['Identifier'])
        for record in f['Records']:
            symbol.add_reference(record['Identifier'])

        exporter.add_symbol(symbol)
        continue

    return None
