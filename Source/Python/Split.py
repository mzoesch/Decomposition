import os
import json
from Source.Python.Exporter import Exporter, Symbol, SourceCodeLocation
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
    def __init__(self, content: str, line: int, column: int):
        self.lines = content.splitlines()
        self.line = line
        self.column = column

    def __iter__(self):
        line, col = self.line, self.column
        while line < len(self.lines):
            while col <= len(self.lines[line-1]):
                yield self.lines[line-1][col-1]
                col += 1

            if col == len(self.lines[line-1]) + 1:
                yield '\n'

            line += 1
            col = 1

    def iter(self):
        return self.__iter__()

    def reversed(self):
        line, col = self.line, self.column
        col -= 1
        while line > 0:
            while col > 0:
                yield self.lines[line-1][col-1]
                col -= 1

            if col == 0:
                yield '\n'

            line -= 1
            if line > 0:
                col = len(self.lines[line-1])


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
        # TODO: Make this more safe to respect the syntax of the language (e.g. comments, strings, etc.).
        for c in cursor.iter():
            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            content += c
            if curly_open == 0 and c == '}':
                content += ';'
                break

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
        for c in cursor.iter():
            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            content += c
            if curly_open == 0 and c == '}':
                content += ';'
                break

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
