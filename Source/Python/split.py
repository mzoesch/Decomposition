import json
import subprocess


def get_intermediate_file() -> str:
    return 'Saved/SccpsIntermediate.json'


def get_output_dir(display_name: str) -> str:
    return f'Saved/OUT_{display_name}'


def ensure_parent_dirs(file_path: str) -> None:
    import os
    parent_dir: str = os.path.dirname(file_path)
    if not os.path.exists(parent_dir):
        os.makedirs(parent_dir)
    return None


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


def get_scc_node_content(node: dict) -> str:
    def has_valid_curly_brackets(in_str: str) -> bool:
        # TODO: Make more advanced with string parsing, etc.
        return in_str.count('{') == in_str.count('}')

    content = ''
    with open(node['AbsolutePath'], 'r') as c_file:
        lines = c_file.readlines()
        start_line: int = node['StartLine'] - 1
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


def operate_on_intermediate_file(n: str, f: str) -> None:
    return None
    # out_dir: str = get_output_dir(n)
    #
    # with open(f, 'r') as json_file:
    #     data = json.load(json_file)
    #
    # counter: int = 0
    # for key, scc in data.items():
    #     out_file: str = '{}/Split_{:03d}.c'.format(out_dir, counter)
    #     content: str = f'// SCC: {key}\n\n'
    #
    #     for include in scc['Includes']:
    #         content += f'{include}\n'
    #         continue
    #     content += '\n\n'
    #
    #     for node in scc['Nodes']:
    #         content += f'// SccNode={node['Identifier']}\n'
    #         content += f'// Path={node['AbsolutePath']}\n'
    #         content += get_scc_node_content(node)
    #         content += f'\n\n'
    #         continue
    #
    #     ensure_parent_dirs(out_file)
    #     with open(out_file, 'w') as c_file:
    #         c_file.write(content)
    #
    #     counter += 1
    #     continue
    # return None
