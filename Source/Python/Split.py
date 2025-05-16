import os
import json
from Source.Python.Exporter import Exporter, Symbol, SymbolReference, SourceCodeLocation
from Source.Python.Types import ESymbolType
from Source.Python.Cursor import Cursor


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
