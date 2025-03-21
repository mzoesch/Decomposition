import argparse
import os
import shutil

def copy_intermediate_files_to_root_ll(args) -> None:
    object_dir: str = f'{args.Intermediate}/CMakeFiles/{args.Module}.dir'
    if os.path.exists(object_dir) is False:
        raise FileNotFoundError(f'No such directory: {object_dir}')

    def _walk_dir(object_dir: str) -> None:
        for root, dirs, files in os.walk(object_dir):
            for dir in dirs:
                _walk_dir(f'{root}/{dir}')
            for file in files:
                if file.endswith('.c.o') is False:
                    continue
                file_path = f'{root}/{file}'
                new_file_path = f'{args.Source}/LlvmIr/{file.replace(".c.o", ".ll")}'
                os.makedirs(os.path.dirname(new_file_path), exist_ok=True)
                print(f'Copying [{file_path}] to [{new_file_path}].')
                shutil.copy2(file_path, new_file_path)
                continue
            continue
        return None

    _walk_dir(object_dir)

    return None


def launch(*args, **kwargs) -> None:
    parser = argparse.ArgumentParser(description='Post build stuff for decomposition plugin. So that we can call opt function on the llvm ir.')
    parser.add_argument('--Intermediate', type=str, required=True, help='Intermediate file path')
    parser.add_argument('--Source',       type=str, required=True, help='Source file path')
    parser.add_argument('--Module',       type=str, required=True, help='Module file path')
    args = parser.parse_args(args=args)

    copy_intermediate_files_to_root_ll(args)

    return None


if __name__ == '__main__':
    import sys
    launch(*sys.argv[1:])
