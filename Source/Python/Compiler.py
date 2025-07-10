import os
import re
import subprocess
from Source.Python.Exporter import Exporter


def compile_impl(args) -> None:
    def get_max_number(d) -> int:
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

    def get_count_of_c_files(d) -> int:
        count = 0
        pattern_c = re.compile(r"Unit_(\d+)\.c$")

        for filename in os.listdir(d):
            if pattern_c.match(filename):
                count += 1
                continue

            continue

        return count

    unit_max = get_max_number(Exporter.get_out_dir_s(args))
    if unit_max == -1:
        raise ValueError("No valid Unit_*.c files found in the output directory.")

    cursor: int = unit_max - get_count_of_c_files(Exporter.get_out_dir_s(args)) + 1
    for p, _, fs in os.walk(Exporter.get_out_dir_s(args)):
        for f in fs:
            if f.endswith('.c') is False:
                continue

            path_f = os.path.join(p, f)
            compile_file(args.VerboseOutput, cursor, path_f, f'{Exporter.get_bin_dir_s(args)}/{f.replace('.c', '.o')}', f, unit_max)
            cursor += 1

            continue

        continue

    return None


def compile_file(verbose, cursor, path_f, path_o, file, unit_max) -> None:
    pattern_c = re.compile(r"Unit_(\d+)\.c$")

    match = pattern_c.match(file)
    assert( match is not None )
    unit_number = int(match.group(1))
    assert( unit_number > 0 )
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
            if new_line is False:
                print('')
                new_line = True
            print(out, end='')
        continue

    if new_line is False:
        print('done')

    return None


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
