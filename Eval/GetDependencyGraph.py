import json
import os
import sys


def main() -> None:
    """
    Execute in the Saved directory of the decomposed codebase to
    generate Graphviz files of dependency graphs and SCCs.
    """

    with open('Report.json', 'r') as f:
        data = json.load(f)
    units = data["Units"]

    def find_unit_name(file: str) -> str:
        for unit in units:
            if unit['Filename'] == file:
                return unit['Name']
        raise ValueError(f"File {file!r} not found.")

    nodes = []
    edges = []
    verbose_edges = []
    for unit in units:
        node_name = f'\"{unit['Filename']} ({unit['Name']})\"'
        nodes.append(f'{node_name};')

        for dep in unit["Deps"]:
            edges.append(f'{node_name} -> \"{dep["Unit"]} ({find_unit_name(dep["Unit"])})\";')
            verbose_edges.append(f'{node_name} -> \"{dep["Unit"]} ({find_unit_name(dep["Unit"])})\" [label=\"{', '.join(dep['Symbols'])}\"];')
        continue

    def write(_name, _nodes, _edges, splines):
        with open(f'.{_name}.dot', 'w') as _f:
            _f.write(f'digraph G {{ranksep=3;nodesep=0.1;splines={splines};pack=false;packmode=clust;')
            for node in _nodes:
                _f.write(node)
            for edge in _edges:
                _f.write(edge)
            _f.write("}\n")
        os.system(f'sccmap .{_name}.dot -o .{_name}_scc.dot > /dev/null')
        os.system(f'dot -Tsvg .{_name}.dot -o {_name}.svg > /dev/null')
        os.system(f'dot -Tsvg .{_name}_scc.dot -o {_name}_scc.svg > /dev/null')
        return

    write('graph', nodes, edges, 'ortho')
    write('graph_verbose', nodes, verbose_edges, 'true')

    return None


if __name__ == '__main__':
    args = sys.argv[1:]
    if len(args) != 1:
        raise ValueError("Expected the path to the repository in question.")
    directory = args[0]
    if not os.path.exists(directory):
        raise ValueError(f"Directory {directory} does not exist.")
    os.chdir(directory)
    main()
