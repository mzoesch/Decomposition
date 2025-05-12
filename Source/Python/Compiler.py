import os
import subprocess
from Source.Python.Exporter import Exporter


def compile_impl(args) -> None:
    for p, _, fs in os.walk(Exporter.get_out_dir_s(args)):
        for f in fs:
            if f.endswith('.c') is False:
                continue

            path_f = os.path.join(p, f)
            compile_file(args.VerboseOutput, path_f, f'{args.TargetBuildBinDir}/{f.replace('.c', '.o')}', f)
            continue
        continue

    return None


def compile_file(verbose, path_f, path_o, file) -> None:
    print(f'Compiling [{file}] ...')
    for out in _run_yielded_cmd([
        'clang', '-c', path_f, '-o', path_o,
    ]):
        if out:
            print(out, end='')
        continue

    return None


def _run_yielded_cmd(cmd):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    for stdout_line in iter(popen.stdout.readline, ""):
        yield stdout_line
    popen.stdout.close()
    return_code = popen.wait()
    if return_code:
        for std_err_line in iter(popen.stderr.readline, ""):
            yield std_err_line
        raise subprocess.CalledProcessError(return_code, cmd)
