import os
import re
import subprocess
from pathlib import Path
from Source.Python.Globals import Globals
from Source.Python.CMakeTargetLoader import load_cmake_targets, pretty_print_cmake_targets


def compile_units(g: Globals) -> None:
    _set_target_to_compile(g)

    if g.split_all_targets:
        targets = load_cmake_targets(g)
        for target in targets:
            _compile_target(g, target)
            continue

    elif g.split_target >= 0:
        targets = load_cmake_targets(g)
        if g.split_target >= len(targets):
            raise ValueError(f'Target index [{g.split_target}] out of range for CMake targets.')
        _compile_target(g, targets[g.split_target])

    elif g.args.SplitWd is not None:
        _compile_target_impl(g, 'unknown', g.args.SplitWd)

    else:
        raise ValueError('No target specified for compilation. Use -CMakeTarget when using CMake else -SplitWd.')

    return None


def _set_target_to_compile(g: Globals) -> None:
    p: Path = Path(g.args.TargetBinDir)
    if p.is_absolute():
        return None

    if g.args.SplitWd is not None:
        cwd = os.getcwd()
        os.chdir(g.args.SplitWd)
        g.args.TargetBinDir = p.absolute()
        os.chdir(cwd)
        return None

    if g.split_target != -1 or g.split_all_targets:
        return None

    assert g.args.CMakeLocation is not None
    targets = load_cmake_targets(g)

    if g.args.CMakeTarget is not None:
        found = False
        for i, (target, entries) in enumerate(targets):
            if target == g.args.CMakeTarget:
                g.split_all_targets = False
                g.split_target = i
                found = True

                break

        if not found:
            raise ValueError(f'Target [{g.args.CMakeTarget}] not found in CMake targets.')

    elif g.split_target != -1:
        if g.split_target >= len(targets):
            raise ValueError(f'Target index [{g.split_target}] out of range for CMake targets.')
        g.split_all_targets = False

    elif not g.split_all_targets:
        pretty_print_cmake_targets(g, targets)
        selection = input('Select by index: ').strip()
        g.split_target = int(selection)

    assert g.split_all_targets or g.split_target >= 0

    return None


def _compile_target(g: Globals, target: tuple[str, list]) -> None:
    name, entries = target
    if len(entries) == 0:
        print(f'No entries for target [{name}]. Skipping')
        return None

    e = entries[0]
    directory = e['directory']

    _compile_target_impl(g, name, f'{directory}/Saved/tar-{name}')

    return None


def _compile_target_impl(g: Globals, display_name: str, directory: str) -> None:
    p: Path = Path(directory)
    if not p.is_absolute():
        p = p.absolute()
    if not p.exists() or not p.is_dir():
        raise ValueError(f'Directory [{p}] does not exist.')

    print(f'Compiling target [{display_name}] in directory [{p}].')

    out_dir = p / 'Out'

    _p: Path = Path(g.args.TargetBinDir)
    if _p.is_absolute():
        bin_dir = Path(g.args.TargetBinDir)
    else:
        bin_dir = p / g.args.TargetBinDir

    if not out_dir.exists():
        raise ValueError(f'Output directory [{out_dir}] does not exist.')

    if not bin_dir.exists():
        os.makedirs(bin_dir, exist_ok=True)

    if g.args.ClearBinOut:
        print('Clearing bin out directory ...', end=' ', flush=True)
        _clear_bin_out_dir(bin_dir)

    out_dir_s = str(out_dir)
    bin_dir_s = str(bin_dir)

    unit_max = _get_max_number(out_dir_s)
    if unit_max == -1:
        raise ValueError("No valid Unit_*.c files found in the output directory.")

    cursor: int = unit_max - _get_count_of_c_files(out_dir_s) + 1
    for p, _, fs in os.walk(out_dir):
        for f in fs:
            if f.endswith('.c') is False:
                continue

            path_f = os.path.join(p, f)
            _compile_file(g.args.Verbose, cursor, path_f, f'{bin_dir_s}/{f.replace('.c', '.o')}', f, unit_max)
            cursor += 1

            continue
        continue

    return None


def _compile_file(verbose: bool, cursor: int, path_f: str, path_o: str, file: str, unit_max: int) -> None:
    pattern_c = re.compile(r"Unit_(\d+)\.c$")

    match = pattern_c.match(file)
    assert match is not None
    unit_number = int(match.group(1))
    assert unit_number > 0
    print(f'[{cursor:0{len(str(unit_max))}d}/{unit_max}] Compiling to [{path_o}] ...', end=' ', flush=True)

    cmd = ['clang', '-c', path_f, '-o', path_o,
           '-Wno-visibility',
           '-Wno-macro-redefined',
           ]
    new_line: bool = False
    if verbose:
        print(' '.join(cmd), end=' ', flush=True)
    for out in _run_yielded_cmd(cmd):
        if out:
            if not new_line:
                print('')
                new_line = True
            print(out, end='')
        continue

    if not new_line:
        print('done')

    return None


def _clear_bin_out_dir(directory: Path) -> None:
    if not directory.exists():
        return None

    removed: int = 0
    for f in os.listdir(directory):
        if f.endswith('.obj'):
            file_path: Path = directory / f
            if file_path.is_file():
                os.remove(file_path)
                removed += 1
        continue

    if removed > 0:
        print(f'Removed {removed} files from [{directory.__str__()}].')

    return None


def _get_max_number(d: str) -> int:
    max_number = -1
    pattern_h = re.compile(r"Unit_(\d+)\.h$")
    pattern_c = re.compile(r"Unit_(\d+)\.c$")

    for filename in os.listdir(d):
        match = pattern_h.match(filename)
        if match:
            number = int(match.group(1))
            if number > max_number:
                max_number = number
            continue

        match = pattern_c.match(filename)
        if match:
            number = int(match.group(1))
            if number > max_number:
                max_number = number
            continue

        continue

    return max_number


def _get_count_of_c_files(d: str) -> int:
    count = 0
    pattern_c = re.compile(r"Unit_(\d+)\.c$")

    for filename in os.listdir(d):
        if pattern_c.match(filename):
            count += 1
            continue

        continue

    return count


def _run_yielded_cmd(cmd):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    def read_stream(stream, tag):
        for line in iter(stream.readline, ""):
            yield line
        stream.close()

    stdout_lines = read_stream(popen.stdout, "stdout")
    stderr_lines = read_stream(popen.stderr, "stderr")

    import threading
    from queue import Queue, Empty

    q = Queue()

    def enqueue_lines(lines):
        for tag_line in lines:
            q.put(tag_line)

    t1 = threading.Thread(target=enqueue_lines, args=(stdout_lines,))
    t2 = threading.Thread(target=enqueue_lines, args=(stderr_lines,))
    t1.start()
    t2.start()

    while t1.is_alive() or t2.is_alive() or not q.empty():
        try:
            yield q.get(timeout=0.1)
        except Empty:
            continue

    return_code = popen.wait()
    if return_code:
        if type(cmd) is list:
            print('ERROR FROM:', ' '.join(cmd))
        else:
            print('ERROR FROM:', cmd)

        raise subprocess.CalledProcessError(return_code, cmd)
