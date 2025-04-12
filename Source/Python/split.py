import json
import subprocess
import os
from enum import Enum


def get_intermediate_file() -> str:
    return 'Saved/SccpsIntermediate.json'


def get_output_dir(display_name: str) -> str:
    return f'Saved/OUT_{display_name}'


def clear_out_dir(display_name: str) -> None:
    out_dir = get_output_dir(display_name)
    if not os.path.exists(out_dir):
        os.makedirs(out_dir)
    for f in os.listdir(out_dir):
        if f.endswith('.c') or f.endswith('.h') or f.endswith('.fwd'):
            file_path: str = os.path.join(out_dir, f)
            if os.path.isfile(file_path):
                os.remove(file_path)
        continue
    return None


def ensure_parent_dirs(file_path: str) -> None:
    import os
    parent_dir: str = os.path.dirname(file_path)
    if not os.path.exists(parent_dir):
        os.makedirs(parent_dir)
    return None


def write_to_file_if_different(file_path: str, content: str) -> bool:
    ensure_parent_dirs(file_path)

    if os.path.exists(file_path):
        with open(file_path, 'r') as c_file:
            old_content = c_file.read()
            if old_content == content:
                return False
            else:
                pass
    else:
        pass

    with open(file_path, 'w') as c_file:
        c_file.write(content)
    return True


def launch_pass(pass_bin: str, pass_name: str, ir_file: str) -> None:
    p_args: list[str] = [
        'opt',
        '-load-pass-plugin',
        pass_bin,
        f"-passes={pass_name}",
        '-disable-output',
        ir_file,
    ]

    with subprocess.Popen(
            p_args,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=False,
    ) as p:
        print(f'Executing: {" ".join(p.args)}')
        p.wait()
        print(p.stdout.read().decode('utf-8'))
        print(p.stderr.read().decode('utf-8'))
        if p.returncode != 0:
            raise RuntimeError(f'Failed to run pass.')

    return None


def is_module_header(args, f: str) -> bool:
    for i in args.Includes: # Not good. Just temporary. Will cause false negatives and positives.
        if f.__contains__(i):
            return True
        continue
    return False


def get_struct_type_node_content(node: dict) -> str:
    content = ''
    with open(node['Source'], 'r') as source_f:
        lines = source_f.readlines()
        start_line: int = node['Line'] - 1

        # TODO: This is ofcourse just temporary and has to be done in a safe manner
        content += lines[start_line]
        while content.__contains__('{') is False:
            start_line += 1
            content += lines[start_line]
            continue

        while content.__contains__('}') is False:
            start_line += 1
            content += lines[start_line]
            continue

    return content


def get_global_node_content(node: dict) -> str:
    content = ''
    with open(node['Source'], 'r') as source_f:
        lines = source_f.readlines()
        start_line: int = node['Line'] - 1
        content = lines[start_line]

    return content


def get_scc_node_content(node: dict) -> str:
    def has_valid_curly_brackets(in_str: str) -> bool:
        # TODO: Make more advanced with string parsing, etc.
        return in_str.count('{') == in_str.count('}')

    content = ''
    with open(node['Source'], 'r') as c_file:
        lines = c_file.readlines()
        start_line: int = node['Line'] - 1
        end_line: int = node['EndLine']
        if start_line < 0 or end_line < 0 or start_line >= len(lines) or end_line > len(lines) or start_line >= end_line:
            raise RuntimeError(f'Invalid line numbers: {start_line}, {end_line} for file {node['AbsolutePath']}')

        for i in range(start_line, end_line):
            content += lines[i]
            continue

        if has_valid_curly_brackets(content) is False:
            for i in range(end_line, len(lines)):
                content += lines[i]
                if lines[i].__contains__('}'):
                    if has_valid_curly_brackets(content) is True:
                        break
                    continue
                continue

    if has_valid_curly_brackets(content) is False:
        raise RuntimeError(f'Unmatched brackets in file {node['AbsolutePath']}')

    return content


def construct_macro(macro: dict) -> str:
    if macro.get('bFunction') is True:
        return f'#define {macro['Identifier']}({", ".join(macro['Params'])}) {macro['Definition']}'
    return f'#define {macro['Identifier']} {macro['Definition']}'


def operate_on_intermediate_file(display_name: str, args, source: str) -> None:
    out_dir: str = get_output_dir(display_name)

    class NodeType(Enum):
        Any = 0
        Struct = 1
        GVar = 2

    class Node:
        def __init__(self, node_type: NodeType, out: str, node: dict):
            self.node_type: NodeType = node_type
            self.identifier: str = node['Identifier']
            self.source: str = node['Source']
            self.exported: str = out

            self.type: str | None = None
            if self.node_type == NodeType.GVar:
                self.type: str | None = node['Type']

            if self.identifier.startswith('struct.'): # Only a short therm solution
                self.identifier = self.identifier[7:]

            assert self.node_type != NodeType.Any, f'Node type cannot be any: {self.__dict__}'
            assert (((self.node_type == NodeType.GVar) is False) or (self.type is not None)), f'Node type is not set: {self.__dict__}'
            return

        def equals(self, type: NodeType, ident: str, source: str) -> bool:
            if type == NodeType.Any:
                return self.identifier == ident and self.source == source
            return self.node_type == type and self.identifier == ident and self.source == source

        def get_as_type(self) -> str:
            if self.node_type is not NodeType.GVar:
                raise RuntimeError(f'Node cannot be typed: {self.__dict__}.')
            assert self.type is not None
            return f'{self.type} {self.identifier}'

        def get_as_local_include(self) -> str:
            if self.node_type is not NodeType.Struct:
                raise RuntimeError(f'Node cannot be imported: {self.__dict__}.')

            last_slash: int = self.exported.rfind('/')
            if last_slash == -1:
                return self.exported
            return self.exported[last_slash + 1:]

    class Exported:
        def __init__(self):
            self._nodes: list[Node] = []
            return

        def append(self, node: Node) -> None:
            if self.find(node.node_type, node.identifier, node.source) is not None:
                raise RuntimeError(f'Node already exists: {node}.')
            self._nodes.append(node)
            return None

        def find_by_dict(self, node: dict) -> Node | None:
            return self.find(NodeType.Any, node['Identifier'], node['Source'])

        def find(self, node_type: NodeType, ident: str, source: str) -> Node | None:
            for node in self._nodes:
                if node.equals(node_type, ident, source):
                    return node
            return None

        def find_by_dict_checked(self, node: dict) -> Node:
            node_found: Node | None = self.find_by_dict(node)
            if node_found is None:
                raise RuntimeError(f'Node not found: {node}')
            return node_found

        def find_checked(self, node_type: NodeType, ident: str, source: str) -> Node:
            node_found: Node | None = self.find(node_type, ident, source)
            if node_found is None:
                raise RuntimeError(f'Node not found: {node_type}, {ident}, {source}')
            return node_found

    exported: Exported = Exported()
    counter: int = 0

    with open(source, 'r') as json_file:
        data = json.load(json_file)

    def find_subroutine_lazy(ident: str, source: str) -> dict | None:
        for scc in data['Sccs']:
            for f in scc['Functions']:
                if f['Identifier'] == ident and f['Source'] == source:
                    return f
                continue
            continue
        return None

    def find_subroutine_lazy_checked(ident: str, source: str) -> dict:
        out: dict | None = find_subroutine_lazy(ident, source)
        if out is None:
            raise RuntimeError(f'Cannot find subroutine: {ident}, {source}')
        return out

    def export_types() -> None:
        nonlocal counter

        type_cursor = data['Types']
        for struct_type in type_cursor:
            out_file: str = '{}/{:04d}StructType_{}.h'.format(out_dir, counter, struct_type['Identifier'])
            content =  f'// Type: {struct_type['Identifier']}\n\n'
            content += get_struct_type_node_content(struct_type)
            content += '\n\n'
            write_to_file_if_different(out_file, content)
            exported.append(Node(NodeType.Struct, out_file, struct_type))
            counter += 1
            continue

        return None

    def export_globals() -> None:
        nonlocal counter

        global_cursor = data['Globals']
        for global_var in global_cursor:
            out_file: str = '{}/{:04d}Global_{}.c'.format(out_dir, counter, global_var['Identifier'])
            content = f'// Global: {global_var['Identifier']}\n\n'
            content += get_global_node_content(global_var)
            content += '\n\n'
            write_to_file_if_different(out_file, content)
            exported.append(Node(NodeType.GVar, out_file, global_var))
            counter += 1
            continue

        return None

    def export_scc(scc: dict) -> None:
        def id_to_valid_file_name(ident: str) -> str:
            return ident.replace(' ', '_').replace(',', '_').replace('(', '').replace(')', '')

        def get_func_sig(func: dict) -> str:
            def get_func_param(param: dict) -> str:
                if param['Type'][-1] == ' ' or param['Type'][-1] == '*':
                    return f'{param['Type']}{param['Identifier']}'
                else:
                    return f'{param['Type']} {param['Identifier']}'
            return f'{func['Ret']} {func['Identifier']}({', '.join([get_func_param(p) for p in func['Params']])})'

        def get_source(source: str) -> dict:
            for f in data['Files']:
                if f['Identifier'] == source:
                    return f
            raise ValueError(f'No such source: [{source}].')

        modified_out: bool = False
        added: list[str] = []

        out_file: str = '{}/{:04d}Scc_{}.c'.format(out_dir, counter, id_to_valid_file_name(scc['Identifier']))
        content = f'// SCC: {scc['Identifier']}\n\n'

        # Scc type includes
        for t in scc['TypeRefs']:
            node: Node = exported.find_by_dict_checked(t)
            out = f'#include "{node.get_as_local_include()}"\n'
            if out in added:
                continue
            added.append(out)
            content += out
            modified_out = True
            continue
        if modified_out:
            content += '\n\n'
            modified_out = False

        # Scc includes --- In the future only merge functions with the same includes
        added_includes: list[str] = []
        for f in scc['Functions']:
            s: dict = get_source(f['Source'])
            for i in s['Includes']:
                if is_module_header(args, i['What']):
                    continue
                if i in added_includes:
                    continue
                added_includes.append(i)
                out = f'#include "{i['Native']}"\n'
                if out in added:
                    continue
                added.append(out)
                content += out
                modified_out = True
                continue
            continue
        if modified_out:
            content += '\n\n'
            modified_out = False

        # Scc extern globals
        for g in scc['GlobalRefs']:
            node: Node = exported.find_by_dict_checked(g)
            out = f'extern {node.get_as_type()};\n'
            if out in added:
                continue
            added.append(out)
            content += out
            modified_out = True
            continue
        if modified_out:
            content += '\n\n'
            modified_out = False

        # Scc forward include declarations
        for f in scc['FunctionRefs']:
            if f['Source'] is None or f['Source'] == '': # Lib or platform
                continue
            f_dict: dict = find_subroutine_lazy_checked(f['Identifier'], f['Source'])
            out = f'{get_func_sig(f_dict)};\n'
            if out in added:
                continue
            added.append(out)
            content += out
            modified_out = True
            continue
        if modified_out:
            content += '\n\n'
            modified_out = False

        # Scc forward declarations
        for f in scc['Functions']:
            out = f'{get_func_sig(f)};\n'
            if out in added:
                continue
            added.append(out)
            content += out
            modified_out = True
            continue
        if modified_out:
            content += '\n\n'
            modified_out = False

        for f in scc['Functions']:
            fwd: str = '.{:04d}Scc_{}_{}.fwd'.format(counter, id_to_valid_file_name(scc['Identifier']), id_to_valid_file_name(f['Identifier']))
            fwd_content = ''

            content += f'// Function: {f['Identifier']}\n'
            content += f'// Path: {f['Source']}\n'
            content += f'#include "{fwd}\"\n'
            content += get_scc_node_content(f)
            content += '\n\n'

            s: dict = get_source(f['Source'])
            for m in s['Macros']:
                fwd_content += f'#pragma push_macro( "{m['Identifier']}" )\n'
                fwd_content += f'{construct_macro(m)}\n'
                continue

            write_to_file_if_different(f'{out_dir}/{fwd}', fwd_content)
            continue

        write_to_file_if_different(out_file, content)
        return None

    def export_sccs() -> None:
        nonlocal counter
        for scc_loop in data['Sccs']:
            export_scc(scc_loop)
            counter += 1
        return None

    export_types()
    export_globals()
    export_sccs()

    return None
