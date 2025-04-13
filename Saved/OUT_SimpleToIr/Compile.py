import sys
import os
import subprocess
from subprocess import CalledProcessError

NUMBER_LENGTH: int = 4
emit_verbose: bool = False


def _get_number_from_file_name(file_name: str) -> int:
    assert file_name.endswith('.c')
    assert len(file_name) >= NUMBER_LENGTH
    num: int = int(file_name[0:NUMBER_LENGTH])
    assert num >= 0
    return num


def _get_all_units() -> list[str]:
    all_units = []
    for file in os.listdir(os.getcwd()):
        if file.endswith('.c'):
            all_units.append(file)
        continue

    return all_units


def _get_units_until(until: int) -> list[str]:
    all_units: list[str] = _get_all_units()
    all_units.sort()

    units_until: list[str] = []
    for f in all_units:
        i: int = _get_number_from_file_name(f)
        if i >= until:
            break
        units_until.append(f)
        continue

    return units_until


def _compile(cmd):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    for stdout_line in iter(popen.stdout.readline, ""):
        yield stdout_line
    popen.stdout.close()
    return_code = popen.wait()
    if return_code:
        for std_err_line in iter(popen.stderr.readline, ""):
            yield std_err_line
        raise subprocess.CalledProcessError(return_code, cmd)


def compile_unit_str(unit: str) -> None:
    if unit.endswith('.c') is False:
        raise ValueError(f'File [{unit}] is not a .c file and can there for not be compiled.')
    if os.path.exists('Intermediate') is False:
        os.makedirs('Intermediate')

    print(f'Compiling [{unit}] ...')
    for out in _compile([
        'clang', '-c', unit, '-o', f'Intermediate/{unit[0:NUMBER_LENGTH]}.o'
    ]):
        if emit_verbose:
            print(out, end="")
        continue

    return None


def compile_unit(unit: int) -> None:
    all_units: list[str] = _get_all_units()
    all_units.sort()
    for f in all_units:
        i: int = _get_number_from_file_name(f)
        if i == unit:
            compile_unit_str(f)
            break
        continue
    return None


def compile_until(until: int) -> None:
    if until < 0:
        to_compile = _get_all_units()
    else:
        to_compile = _get_units_until(until)
    for f in to_compile:
        compile_unit_str(f)
    return None


def link() -> None:
    os.makedirs('Out', exist_ok=True)

    files = [f for f in os.listdir(f'Intermediate') if f.endswith('.o')]
    if len(files) == 0:
        raise ValueError('No object files to link.')

    print('Linking ...')

    for out in _compile([
        'clang', '-o', 'Out/a.out', *[f'Intermediate/{f}' for f in files]
    ]):
        if emit_verbose:
            print(out, end="")
        continue

    return None

def default_parse_args() -> None:
    import argparse

    parser = argparse.ArgumentParser(description="Wrapper to help compile out files.")
    parser.add_argument('-Until',   type=int,            help='Until which step to compile. Default to -1 (compile all).')
    parser.add_argument('-Only',    type=int,            help='Only compile this step. If this is set, -Until is ignored.')
    parser.add_argument('-Link',    action='store_true', help='Wether to link at the end.')
    parser.add_argument('-Verbose', action='store_true', help='Whether to emit verbose output.')

    args = parser.parse_args(sys.argv[1:])

    if args.Verbose:
        global emit_verbose
        emit_verbose = True

    if args.Only is not None:
        compile_unit(args.Only)
    elif args.Until is not None:
        compile_until(args.Until)

    if args.Link:
        link()

    return None


if __name__ == "__main__":
    default_parse_args()
