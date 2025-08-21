import json
import re
import os
from collections import defaultdict
from Source.Python.Globals import Globals


def load_cmake_targets(g: Globals) -> any:
    compile_command_file = os.path.join(g.args.TargetBuildDir, 'compile_commands.json')
    if not os.path.exists(compile_command_file) or not os.path.isfile(compile_command_file):
        raise ValueError(f'No such file [{compile_command_file}].')
    with open(compile_command_file, 'r') as f:
        cmds = json.load(f)

    targets = defaultdict(list)

    for entry in cmds:
        cmd = entry['command']
        match = re.search(r'-o\s+.*CMakeFiles/([^/]+)\.dir/', cmd)
        if match:
            target = match.group(1)
            targets[target].append(entry)
        else:
            targets['_unknown'].append(entry)

    return sorted(targets.items(), key=lambda x: len(x[1]), reverse=True)


def pretty_print_cmake_targets(g: Globals, targets = None) -> None:
    if targets is None:
        targets = load_cmake_targets(g)

    print('Fetched Targets:')
    for i, (target, entries) in reversed(list(enumerate(targets))):
        print(f'[{i}] {target} ({len(entries)} files)')
        for e in entries[:3]:
            print(f'        {e['file']}')
        if len(entries) > 3:
            print('        ...')

    return None
