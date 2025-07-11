import os
import json
from Source.Python.Exporter import Exporter, Symbol, SymbolReference, SourceCodeLocation
from Source.Python.Types import ESymbolType
from Source.Python.Cursor import Cursor


def split_impl(args) -> None:
    exporter: Exporter = Exporter(args)

    with open(exporter.get_intermediate_file(), 'r') as f:
        ir = json.load(f)

    print('Collecting records ...', end=' ')
    _export_records(exporter, args, ir)
    print(f'done [{len(exporter.symbols)}]')
    last = len(exporter.symbols)

    print('Collecting typedefs ...', end=' ')
    _export_typedefs(exporter, args, ir)
    print(f'done [{len(exporter.symbols) - last}]')
    last = len(exporter.symbols)

    print('Collecting functions ...', end=' ')
    _export_functions(exporter, args, ir)
    print(f'done [{len(exporter.symbols) - last}]')

    print(f'Exporting [{len(exporter.symbols)}] symbols ...')
    exporter.export(ir)

    return None


def _get_file_content(file_path) -> str:
    with open(file_path, 'r') as c_file:
        content = c_file.read()
        return content


def _export_records(exporter: Exporter, args, ir) -> None:
    for r in ir['Records']:
        content = ''
        cursor = Cursor(
            args,
            _get_file_content(r['Source']),
            r['Line'],
            r['Column']
            )

        content += f'{r['Type']} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if c is None:
                content = content[:-1]
                continue

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

        decldoc_content: str | None = None
        if args.PurgeDeclDocs is False:
            def _extract_decl_doc() -> None:
                nonlocal decldoc_content

                def _extract_decl_doc_impl(
                        # The line. Zero-based.
                        _line: int,
                        # The column. Zero-based.
                        _column: int,
                        # The number of grace lines we give. Else we give up.
                        grace: int = 0
                    ) -> (
                        tuple[ # Returns a tuple if a decl doc is found.
                            int, # One-based start line
                            int, # One-based start column
                            int, # One-based end line
                            int  # One-based end column
                        ]
                        | None # Returns None if no decl doc is found.
                    ):

                    _in_line: int = _line
                    _in_column: int = _column
                    _in_grace: int = grace

                    # Whether we are ok.
                    _ok: bool = False

                    # Whether we are inside a multiline comment that behaves like a decl doc.
                    _is_multiline_comment: bool = False
                    # One-based line and column.
                    _end_multiline_comment_line: int | None = None
                    _end_multiline_comment_column: int | None = None
                    _end_comment_line: int | None = None

                    # One-based line and column.
                    _start_line: int | None = None
                    _start_column: int | None = None

                    _in_multiline_comment: bool = False

                    # TODO: Make escapes work correctly...
                    last_char: str = ''
                    while grace >= 0 or _in_multiline_comment:
                        def prev_column() -> None:
                            nonlocal _column
                            nonlocal last_char
                            last_char = _c
                            _column -= 1
                            return None

                        if _column < 0:
                            _line -= 1
                            if _line < 0:
                                return None
                            _column = len(f_lines[_line]) - 1
                            grace -= 1
                            continue
                        if _line < 0:
                            return None

                        _c: str = f_lines[_line][_column]

                        if _in_multiline_comment:
                            if _c == '/' and last_char == '*':
                                _is_multiline_comment = True
                                _ok = True
                                _start_line = _line + 1
                                _start_column = _column + 1
                                break
                            else:
                                prev_column()
                                continue

                        if _c == '*' and last_char == '/':
                            _in_multiline_comment = True
                            _end_multiline_comment_line = (
                                _line
                                + 1 # One-based line
                               )
                            _end_multiline_comment_column = (
                                _column
                                + 1 # One-based column
                                + 2 # For the '*/'
                                )
                            grace = 0
                            prev_column()
                            continue

                        prev_column()
                        continue

                    if not _ok:
                        assert ((_start_line is None) and (_start_column is None))

                        # Search for non multiline comments.
                        _line = _in_line + 1
                        _column = _in_column
                        grace = _in_grace

                        while grace >= 0:
                            _line -= 1

                            if _line < 0:
                                if _end_comment_line is not None:
                                    _ok = True
                                    _start_line = 1
                                    _start_column = 1
                                break

                            current_line_str = f_lines[_line]
                            current_line_str = current_line_str.lstrip()

                            if current_line_str.startswith('//'):
                                if _end_comment_line is None:
                                    _end_comment_line = _line + 1
                                continue

                            if _end_comment_line is None:
                                grace -= 1
                                continue

                            # We have reached the end of the single line comment over multiple lines.
                            _ok = True
                            _start_line = (_line
                                + 1 # One-based line
                                + 1 # Because we searched one above the line we are on
                                )
                            _start_column = 1
                            break

                    if _ok:
                        assert ((_start_line is not None) and (_start_column is not None))

                        if _is_multiline_comment:
                            assert (
                                    (_end_multiline_comment_line is not None)
                                and (_end_multiline_comment_column is not None)
                                )
                            return (
                                _start_line, _start_column,
                                _end_multiline_comment_line, _end_multiline_comment_column
                                )
                        else:
                            assert (_end_comment_line is not None)
                            return (
                                _start_line, _start_column,
                                _end_comment_line, len(f_lines[_end_comment_line - 1])
                                    + 1 # One-based column
                                )
                    else:
                        return None

                f_content: str = _get_file_content(r['Source'])
                f_lines: list[str] = f_content.splitlines()

                c_type: str = r['Type']
                column_cursor: int = (r['Column']
                    - 1 # Zero bound but line is one based
                    )

                line_cursor: int = r['Line'] - 1 # Same here

                column: str = f_lines[line_cursor][:column_cursor]
                column = column.rstrip()

                if column[len(column) - len(c_type):] != c_type:
                    return None

                column = column[:len(column) - len(c_type)].rstrip()
                if column[len(column) - len('typedef'):] == 'typedef':
                    column = column[:len(column) - len('typedef')].rstrip()

                doc: tuple[int, int, int, int] | None = None
                if len(column) > 0:
                    doc: (
                        tuple[ # Returns a tuple if a decl doc is found.
                            int, # One-based start line
                            int, # One-based start column
                            int, # One-based end line
                            int  # One-based end column
                        ]
                        | None # Returns None if no decl doc is found.
                    ) = _extract_decl_doc_impl(line_cursor, len(column) - 1, 1)
                else:
                    line_cursor = line_cursor - 1
                    if line_cursor >= 0:
                        doc: (
                            tuple[ # Returns a tuple if a decl doc is found.
                                int, # One-based start line
                                int, # One-based start column
                                int, # One-based end line
                                int  # One-based end column
                            ]
                            | None # Returns None if no decl doc is found.
                        ) = _extract_decl_doc_impl(line_cursor, len(f_lines[line_cursor]) - 1)

                if doc is not None:
                    _cursor: Cursor = Cursor(
                        args,
                        f_content,
                        doc[0], doc[1],
                        doc[2], doc[3]
                        )

                    decldoc_content = ''
                    for _decldoc_c in _cursor.iter_no_syntax():
                        if _decldoc_c is None:
                            decldoc_content = decldoc_content[:-1]
                            continue
                        decldoc_content += _decldoc_c
                        continue

                return None

            _extract_decl_doc()

        symbol: Symbol = Symbol(
            ESymbolType.RECORD,
            r['Identifier'],
            content,
            decldoc_content,
            SourceCodeLocation(r['Source'], r['Line'], r['Column']),
            None,
            r,
            )
        for record in r['Records']:
            symbol.add_reference(record['Identifier'], 'record')

        exporter.add_symbol(symbol)
        continue

    return None


def _export_typedefs(exporter: Exporter, args, ir) -> None:
    for td in ir['Typedefs']:
        refs: list[SymbolReference] = []
        for record in td['Records']:
            refs.append(SymbolReference(record['Identifier'], 'record'))
            continue

        decldoc_content: str | None = None
        if args.PurgeDeclDocs is False:
            def _extract_decl_doc() -> None:
                nonlocal decldoc_content

                def __extract_decl_doc_impl(
                    # The line. Zero-based.
                    _line: int,
                    # The column. Zero-based.
                    _column: int,
                    # The number of grace lines we give. Else we give up.
                    grace: int = 0
                ) -> (
                    tuple[ # Returns a tuple if a decl doc is found.
                        int, # One-based start line
                        int, # One-based start column
                        int, # One-based end line
                        int  # One-based end column
                    ]
                    | None # Returns None if no decl doc is found.
                    ):

                    _in_line: int = _line
                    _in_column: int = _column
                    _in_grace: int = grace

                    # Whether we are ok.
                    _ok: bool = False

                    # Whether we are inside a multiline comment that behaves like a decl doc.
                    _is_multiline_comment: bool = False
                    # One-based line and column.
                    _end_multiline_comment_line: int | None = None
                    _end_multiline_comment_column: int | None = None
                    _end_comment_line: int | None = None

                    # One-based line and column.
                    _start_line: int | None = None
                    _start_column: int | None = None

                    _in_multiline_comment: bool = False

                    last_char: str = ''
                    while grace >= 0 or _in_multiline_comment:
                        def prev_column() -> None:
                            nonlocal _column
                            nonlocal last_char
                            last_char = _c
                            _column -= 1
                            return None

                        if _column < 0:
                            _line -= 1
                            if _line < 0:
                                return None
                            _column = len(_f_lines[_line]) - 1
                            grace -= 1
                            continue
                        if _line < 0:
                            return None

                        _c: str = _f_lines[_line][_column]

                        if _in_multiline_comment:
                            if _c == '/' and last_char == '*':
                                _is_multiline_comment = True
                                _ok = True
                                _start_line = _line + 1
                                _start_column = _column + 1
                                break
                            else:
                                prev_column()
                                continue

                        if _c == '*' and last_char == '/':
                            _in_multiline_comment = True
                            _end_multiline_comment_line = (
                                    _line
                                    + 1 # One-based line
                            )
                            _end_multiline_comment_column = (
                                    _column
                                    + 1 # One-based column
                                    + 2 # For the '*/'
                            )
                            grace = 0
                            prev_column()
                            continue

                        prev_column()
                        continue

                    if not _ok:
                        assert ((_start_line is None) and (_start_column is None))

                        # Search for non multiline comments.
                        _line = _in_line + 1
                        _column = _in_column
                        grace = _in_grace

                        while grace >= 0:
                            _line -= 1

                            if _line < 0:
                                if _end_comment_line is not None:
                                    _ok = True
                                    _start_line = 1
                                    _start_column = 1
                                break

                            current_line_str = _f_lines[_line]
                            current_line_str = current_line_str.lstrip()

                            if current_line_str.startswith('//'):
                                if _end_comment_line is None:
                                    _end_comment_line = _line + 1
                                continue

                            if _end_comment_line is None:
                                grace -= 1
                                continue

                            # We have reached the end of the single line comment over multiple lines.
                            _ok = True
                            _start_line = (_line
                                + 1 # One-based line
                                + 1 # Because we searched one above the line we are on
                                )
                            _start_column = 1
                            break

                    if _ok:
                        assert ((_start_line is not None) and (_start_column is not None))

                        if _is_multiline_comment:
                            assert (
                                    (_end_multiline_comment_line is not None)
                                    and (_end_multiline_comment_column is not None)
                            )
                            return (
                                _start_line, _start_column,
                                _end_multiline_comment_line, _end_multiline_comment_column
                            )
                        else:
                            assert (_end_comment_line is not None)
                            return (
                                _start_line, _start_column,
                                _end_comment_line, len(_f_lines[_end_comment_line - 1])
                                    + 1 # One-based column
                            )
                    else:
                        return None

                _f_content: str = _get_file_content(td['Source'])
                _f_lines: list[str] = _f_content.splitlines()

                _doc: (
                    tuple[ # Returns a tuple if a decl doc is found.
                        int, # One-based start line
                        int, # One-based start column
                        int, # One-based end line
                        int  # One-based end column
                    ]
                    | None # Returns None if no decl doc is found.
                ) = __extract_decl_doc_impl(
                    td['Line'] - 1, # Convert to zero-based.
                    td['Column'] - 1, # Convert to zero-based.
                    1 # Give one grace line.
                    )

                if _doc is not None:
                    _cursor: Cursor = Cursor(
                        args,
                        _f_content,
                        _doc[0], _doc[1],
                        _doc[2], _doc[3]
                        )

                    assert (decldoc_content is None)
                    decldoc_content = ''
                    for _decldoc_c in _cursor.iter_no_syntax():
                        if _decldoc_c is None:
                            decldoc_content = decldoc_content[:-1]
                            continue
                        decldoc_content += _decldoc_c
                        continue

                return None

            _extract_decl_doc()

        if td['Complex']:
            f_content = _get_file_content(td['Source'])

            content = 'typedef '
            cursor = Cursor(
                args,
                f_content,
                td['ComplexBeginLine'], td['ComplexBeginColumn'],
                td['Line'], td['Column'],
                )
            for c in cursor.iter_no_syntax():
                if c is None:
                    content = content[:-1]
                    continue
                content += c

            content += f'{td['Identifier']};'

            if td.get('ComplexTypeDecl') is not None:
                for ref in td['ComplexTypeDecl']['Records']:
                    refs.append(SymbolReference(ref['Identifier']))

            if args.PurgeDeclDocs is False:
                if decldoc_content is None:
                    def _extract_decl_doc_impl(
                        # The line. Zero-based.
                        _line: int,
                        # The column. Zero-based.
                        _column: int,
                        # The number of grace lines we give. Else we give up.
                        grace: int = 0
                    ) -> (
                        tuple[ # Returns a tuple if a decl doc is found.
                            int, # One-based start line
                            int, # One-based start column
                            int, # One-based end line
                            int  # One-based end column
                        ]
                        | None # Returns None if no decl doc is found.
                        ):

                        _in_line: int = _line
                        _in_column: int = _column
                        _in_grace: int = grace

                        # Whether we are ok.
                        _ok: bool = False

                        # Whether we are inside a multiline comment that behaves like a decl doc.
                        _is_multiline_comment: bool = False
                        # One-based line and column.
                        _end_multiline_comment_line: int | None = None
                        _end_multiline_comment_column: int | None = None
                        _end_comment_line: int | None = None

                        # One-based line and column.
                        _start_line: int | None = None
                        _start_column: int | None = None

                        _in_multiline_comment: bool = False

                        last_char: str = ''
                        while grace >= 0 or _in_multiline_comment:
                            def prev_column() -> None:
                                nonlocal _column
                                nonlocal last_char
                                last_char = _c
                                _column -= 1
                                return None

                            if _column < 0:
                                _line -= 1
                                if _line < 0:
                                    return None
                                _column = len(f_lines[_line]) - 1
                                grace -= 1
                                continue
                            if _line < 0:
                                return None

                            _c: str = f_lines[_line][_column]

                            if _in_multiline_comment:
                                if _c == '/' and last_char == '*':
                                    _is_multiline_comment = True
                                    _ok = True
                                    _start_line = _line + 1
                                    _start_column = _column + 1
                                    break
                                else:
                                    prev_column()
                                    continue

                            if _c == '*' and last_char == '/':
                                _in_multiline_comment = True
                                _end_multiline_comment_line = (
                                        _line
                                        + 1 # One-based line
                                )
                                _end_multiline_comment_column = (
                                        _column
                                        + 1 # One-based column
                                        + 2 # For the '*/'
                                )
                                grace = 0
                                prev_column()
                                continue

                            prev_column()
                            continue

                        if not _ok:
                            assert ((_start_line is None) and (_start_column is None))

                            # Search for non multiline comments.
                            _line = _in_line + 1
                            _column = _in_column
                            grace = _in_grace

                            while grace >= 0:
                                _line -= 1

                                if _line < 0:
                                    if _end_comment_line is not None:
                                        _ok = True
                                        _start_line = 1
                                        _start_column = 1
                                    break

                                current_line_str = f_lines[_line]
                                current_line_str = current_line_str.lstrip()

                                if current_line_str.startswith('//'):
                                    if _end_comment_line is None:
                                        _end_comment_line = _line + 1
                                    continue

                                if _end_comment_line is None:
                                    grace -= 1
                                    continue

                                # We have reached the end of the single line comment over multiple lines.
                                _ok = True
                                _start_line = (_line
                                    + 1 # One-based line
                                    + 1 # Because we searched one above the line we are on
                                    )
                                _start_column = 1
                                break

                        if _ok:
                            assert ((_start_line is not None) and (_start_column is not None))

                            if _is_multiline_comment:
                                assert (
                                        (_end_multiline_comment_line is not None)
                                        and (_end_multiline_comment_column is not None)
                                )
                                return (
                                    _start_line, _start_column,
                                    _end_multiline_comment_line, _end_multiline_comment_column
                                )
                            else:
                                assert (_end_comment_line is not None)
                                return (
                                    _start_line, _start_column,
                                    _end_comment_line, len(f_lines[_end_comment_line - 1])
                                        + 1 # One-based column
                                )
                        else:
                            return None

                    f_lines: list[str] = f_content.splitlines()
                    doc: (
                        tuple[ # Returns a tuple if a decl doc is found.
                            int, # One-based start line
                            int, # One-based start column
                            int, # One-based end line
                            int  # One-based end column
                        ]
                        | None # Returns None if no decl doc is found.
                        ) = _extract_decl_doc_impl(
                            td['ComplexBeginLine'] - 1, # Convert to zero-based.
                            td['ComplexBeginColumn'] - 1, # Convert to zero-based.
                            1 # Give one grace line.
                        )

                    if doc is not None:
                        cursor: Cursor = Cursor(
                            args,
                            f_content,
                            doc[0], doc[1],
                            doc[2], doc[3]
                        )

                        assert (decldoc_content is None)
                        decldoc_content = ''
                        for decldoc_c in cursor.iter_no_syntax():
                            if decldoc_c is None:
                                decldoc_content = decldoc_content[:-1]
                                continue
                            decldoc_content += decldoc_c
                            continue

            symbol: Symbol = Symbol(
                ESymbolType.RECORD,
                td['Identifier'],
                content,
                decldoc_content,
                SourceCodeLocation(td['Source'], td['Line'], td['Column']),
                refs,
                )
        else:
            symbol: Symbol = Symbol(
                ESymbolType.RECORD,
                td['Identifier'],
                f'typedef {td['What']};',
                decldoc_content,
                SourceCodeLocation(td['Source'], td['Line'], td['Column']),
                refs
                )

        if not (td['Type'] is None):
            symbol.add_reference(td['Type'], 'record')

        for record in td['Records']:
            symbol.add_reference(record['Identifier'], 'record')

        exporter.add_symbol(symbol)
        continue

    return None


def _export_functions(exporter: Exporter, args, it) -> None:
    if 'Functions' not in it:
        return None

    for f in it['Functions']:
        content = ''
        cursor = Cursor(
            args,
            _get_file_content(f['Source']),
            f['Line'],
            f['Column']
            )

        # TODO Solve the static problem later on...
        if args.RespectStatic:
            if f['bStatic']:
                content += 'static '
        content += f'{f['Ret']} '

        curly_open: int = 0
        for c, valid in cursor.iter():
            if c is None:
                content = content[:-1]
                continue

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

        decldoc_content: str | None = None
        if args.PurgeDeclDocs is False:
            def _extract_decl_doc() -> None:
                nonlocal decldoc_content

                def _extract_decl_doc_impl(
                    # The file content.
                    _f_content: str,
                    # The line. Zero-based.
                    _line: int,
                    # The column. Zero-based.
                    _column: int,
                    # The number of grace lines we give. Else we give up.
                    grace: int = 0
                ) -> (
                    tuple[ # Returns a tuple if a decl doc is found.
                        int, # One-based start line
                        int, # One-based start column
                        int, # One-based end line
                        int  # One-based end column
                    ]
                    | None # Returns None if no decl doc is found.
                ):

                    _in_line: int = _line
                    _in_column: int = _column
                    _in_grace: int = grace

                    _f_lines: list[str] = _f_content.splitlines()

                    # Whether we are ok.
                    _ok: bool = False

                    # Whether we are inside a multiline comment that behaves like a decl doc.
                    _is_multiline_comment: bool = False
                    # One-based line and column.
                    _end_multiline_comment_line: int | None = None
                    _end_multiline_comment_column: int | None = None
                    _end_comment_line: int | None = None

                    # One-based line and column.
                    _start_line: int | None = None
                    _start_column: int | None = None

                    _in_multiline_comment: bool = False

                    last_char: str = ''
                    while grace >= 0 or _in_multiline_comment:
                        def prev_column() -> None:
                            nonlocal _column
                            nonlocal last_char
                            last_char = _c
                            _column -= 1
                            return None

                        if _column < 0:
                            _line -= 1
                            if _line < 0:
                                return None
                            _column = len(_f_lines[_line]) - 1
                            grace -= 1
                            continue
                        if _line < 0:
                            return None

                        _c: str = _f_lines[_line][_column]

                        if _in_multiline_comment:
                            if _c == '/' and last_char == '*':
                                _is_multiline_comment = True
                                _ok = True
                                _start_line = _line + 1
                                _start_column = _column + 1
                                break
                            else:
                                prev_column()
                                continue

                        if _c == '*' and last_char == '/':
                            _in_multiline_comment = True
                            _end_multiline_comment_line = (
                                _line
                                + 1 # One-based line
                                )
                            _end_multiline_comment_column = (
                                _column
                                + 1 # One-based column
                                + 2 # For the '*/'
                                )
                            grace = 0
                            prev_column()
                            continue

                        prev_column()
                        continue

                    if not _ok:
                        assert ((_start_line is None) and (_start_column is None))

                        # Search for non multiline comments.
                        _line = _in_line + 1
                        _column = _in_column
                        grace = _in_grace

                        while grace >= 0:
                            _line -= 1

                            if _line < 0:
                                if _end_comment_line is not None:
                                    _ok = True
                                    _start_line = 1
                                    _start_column = 1
                                break

                            current_line_str = _f_lines[_line]
                            current_line_str = current_line_str.lstrip()

                            if current_line_str.startswith('//'):
                                if _end_comment_line is None:
                                    _end_comment_line = _line + 1
                                continue

                            if _end_comment_line is None:
                                grace -= 1
                                continue

                            # We have reached the end of the single line comment over multiple lines.
                            _ok = True
                            _start_line = (_line
                                + 1 # One-based line
                                + 1 # Because we searched one above the line we are on
                                )
                            _start_column = 1
                            break

                    if _ok:
                        assert ((_start_line is not None) and (_start_column is not None))

                        if _is_multiline_comment:
                            assert (
                                    (_end_multiline_comment_line is not None)
                                    and (_end_multiline_comment_column is not None)
                            )
                            return (
                                _start_line, _start_column,
                                _end_multiline_comment_line, _end_multiline_comment_column
                            )
                        else:
                            assert (_end_comment_line is not None)
                            return (
                                _start_line, _start_column,
                                _end_comment_line, len(_f_lines[_end_comment_line - 1])
                                    + 1 # One-based column
                            )
                    else:
                        return None

                decldoc_content_tuple: tuple[int, int, int, int] | None = None
                latest_decldoc_source: str | None = None

                # First try the function definition, if there is nothing, then try the
                # function declaration(s) if available.
                decldoc_content_tuple: (
                    tuple[ # Returns a tuple if a decl doc is found.
                        int, # One-based start line
                        int, # One-based start column
                        int, # One-based end line
                        int  # One-based end column
                    ]
                    | None # Returns None if no decl doc is found.
                ) = _extract_decl_doc_impl(
                    _get_file_content(f['Source']),
                    f['Line'] - 1, # Convert to zero-based.
                    f['Column'] - 1, # Convert to zero-based.
                    1 # Give one grace line.
                    )
                latest_decldoc_source = f['Source']

                if (decldoc_content_tuple is None) and ('Decls' in f):
                    for decl in f['Decls']:
                        decldoc_content_tuple: (
                            tuple[ # Returns a tuple if a decl doc is found.
                                int, # One-based start line
                                int, # One-based start column
                                int, # One-based end line
                                int  # One-based end column
                            ]
                            | None # Returns None if no decl doc is found.
                        ) = _extract_decl_doc_impl(
                            _get_file_content(decl['Source']),
                            decl['Line'] - 1, # Convert to zero-based.
                            decl['Column'] - 1, # Convert to zero-based.
                            1 # Give one grace line.
                            )

                        if decldoc_content_tuple is not None:
                            latest_decldoc_source = decl['Source']
                            break

                        continue

                if decldoc_content_tuple is not None:
                    _cursor: Cursor = Cursor(
                        args,
                        _get_file_content(latest_decldoc_source),
                        decldoc_content_tuple[0], decldoc_content_tuple[1],
                        decldoc_content_tuple[2], decldoc_content_tuple[3]
                        )

                    decldoc_content = ''
                    for _decldoc_c in _cursor.iter_no_syntax():
                        if _decldoc_c is None:
                            decldoc_content = decldoc_content[:-1]
                            continue
                        decldoc_content += _decldoc_c
                        continue

                return None

            _extract_decl_doc()

        symbol: Symbol = Symbol(
            ESymbolType.FUNCTION,
            f['Identifier'],
            content,
            decldoc_content,
            SourceCodeLocation(f['Source'], f['Line'], f['Column']),
            None,
            f,
            )

        for callee in f['Callees']:
            symbol.add_reference(callee['Identifier'], 'callee')
        for record in f['Records']:
            symbol.add_reference(record['Identifier'], 'record')

        # Deprecated as:
        # The visitor should take care of the records from returns and params.
        #     symbol.add_reference(f['Ret'], 'record')
        #     for p in f['Params']:
        #         symbol.add_reference(p['Type'], 'record')

        exporter.add_symbol(symbol)
        continue

    return None
