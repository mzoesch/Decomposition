import sys
import os


def launch() -> None:
    if len(sys.argv) != 3:
        print('Usage: python CompareLibsForDiff.py <lib_a> <lib_b>')
        return None

    lib_a = sys.argv[1]
    lib_b = sys.argv[2]

    cmd_a = f'nm -U -W -j {lib_a} | sort'
    cmd_b = f'nm -U -W -j {lib_b} | sort'

    print(f'Comparing libraries:\n  {lib_a}\n  {lib_b}')
    print(f'Running command [{cmd_a}].')
    result_a = os.popen(cmd_a).read()
    print(f'Running command [{cmd_b}].')
    result_b = os.popen(cmd_b).read()

    lines_a = result_a.splitlines()
    lines_b = result_b.splitlines()
    set_a = set(lines_a)
    set_b = set(lines_b)
    only_in_a = set_a - set_b
    only_in_b = set_b - set_a

    only_in_a = {line for line in only_in_a if not (line.startswith('.') or line.startswith('__PRETTY_FUNCTION__'))}
    only_in_b = {line for line in only_in_b if not (line.startswith('.') or line.startswith('__PRETTY_FUNCTION__'))}

    if len(only_in_a) > 0:
        print('Only in A:')
        for line in sorted(only_in_a):
            print(line)

    if len(only_in_b) > 0:
        print('Only in B:')
        for line in sorted(only_in_b):
            print(line)

    if len(only_in_a) == 0 and len(only_in_b) == 0:
        print('No differences found.')

    return None


if __name__ == '__main__':
    launch()
