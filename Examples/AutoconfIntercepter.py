import os
import sys


def run_after_autoconf() -> None:
    args = sys.argv[1:]

    for a in args:
        if not a.strip('-IrPath='):
            continue

        path = f'{a.strip('-IrPath=')}/ir.db'
        if os.path.exists(path):
            print(f'Removing autoconf files: [{path}].')
            os.remove(path)

    return None


if __name__ == '__main__':
    run_after_autoconf()
