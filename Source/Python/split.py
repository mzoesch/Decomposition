import os
import json

_files_updated: int = 0

def get_out_dir(args) -> str:
    return f'{args.TargetBuildDir}/Saved/Out'


def get_intermediate_file(args) -> str:
    return f'{args.TargetBuildDir}/Saved/IR.json'


def split_impl(args) -> None:
    out: str = get_out_dir(args)

    if os.path.exists(out) is False:
        os.makedirs(out)
    if os.path.isdir(out) is False:
        raise ValueError(f'No such directory [{out}].')

    with open(get_intermediate_file(args), 'r') as f:
        ir = json.load(f)

    _export_records(args, ir, out)
    _export_typedefs(args, ir, out)
    _export_functions(args, ir, out)

    print(f'Updated {_files_updated} files with a total of [{len(ir["Records"])}] records, '
          f'[{len(ir["Typedefs"])}] typedefs and [{len(ir["Functions"])}] functions.')

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


def _write_to_file_if_different(file_path, content) -> None:
    global _files_updated

    parent = os.path.dirname(file_path)
    if not os.path.exists(parent):
        os.makedirs(parent)

    if os.path.exists(file_path):
        with open(file_path, 'r') as c_file:
            old_content = c_file.read()
            if old_content == content:
                return
            else:
                pass
    else:
        pass

    with open(file_path, 'w') as c_file:
        c_file.write(content)
        _files_updated += 1

    return None


def _get_file_content(file_path) -> str:
    with open(file_path, 'r') as c_file:
        content = c_file.read()
        return content


def _export_records(args, ir, out: str) -> None:
    for r in ir['Records']:
        source = _get_file_content(r['Source'])
        out_f = f'{out}/Record_{r['Identifier']}.h'
        content = ''
        cursor = Cursor(source, r['Line'], r['Column'])

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

        content += '\n\n'
        _write_to_file_if_different(out_f, content)
        continue

    return None


def _export_typedefs(args, ir, out: str) -> None:
    for td in ir['Typedefs']:
        out_f = f'{out}/Typedef_{td["Identifier"]}.h'
        content = f'typedef {td['What']};'

        content += '\n\n'
        _write_to_file_if_different(out_f, content)
        continue

    return None


def _export_functions(args, it, out: str) -> None:

    def path_to_valid_name(path: str) -> str:
        return path.replace('/', '_').replace('\\', '_').replace(':', '_').replace(' ', '_')

    for f in it['Functions']:
        source = _get_file_content(f['Source'])
        if f['bStatic']:
            out_f = f'{out}/StaticFunction_{f['Identifier']}____{path_to_valid_name(f['Source'])}.c'
        else:
            out_f = f'{out}/Function_{f["Identifier"]}.c'
        content = ''
        cursor = Cursor(source, f['Line'], f['Column'])

        if f['bStatic']:
            content += 'static '
        content += f'{f['Ret']} '

        curly_open: int = 0
        for c in cursor.iter():
            curly_open += 1 if c == '{' else 0
            curly_open -= 1 if c == '}' else 0
            content += c
            if curly_open == 0 and c == '}':
                content += ';'
                break

        content += '\n\n'
        _write_to_file_if_different(out_f, content)
        continue

    return None
