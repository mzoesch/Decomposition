import argparse
import os
import shutil
import subprocess

F_SFX: str = '.c.o'
F_OUT_SFX: str = '.ll' # .ll or .bc
F_LNK_SFX: str = '.bc'

def copy_intermediate_files_to_root_ll(args) -> None:
    object_dir: str = f'{args.Intermediate}/CMakeFiles/{args.Module}.dir'
    if os.path.exists(object_dir) is False:
        raise FileNotFoundError(f'No such directory: {object_dir}')

    def _walk_dir(object_dir: str, touched_files) -> None:
        for root, _, files in os.walk(object_dir):
            rel_dir: str = os.path.relpath(root, object_dir)
            if rel_dir == '.':
                rel_dir = ''
            else:
                rel_dir = f'{rel_dir}/'

            for file in files:
                if file.endswith('.c.o') is False:
                    continue
                file_path = f'{root}/{file}'
                new_file_path = f'{args.Source}/Saved/Ir/{rel_dir}{file.replace(F_SFX, F_OUT_SFX)}'
                os.makedirs(os.path.dirname(new_file_path), exist_ok=True)
                print(f'Copying [{file_path}] to [{new_file_path}].')
                shutil.copy2(file_path, new_file_path)
                touched_files.append(new_file_path)
                continue

            continue
        return None

    touched_files: list[str] = []
    _walk_dir(object_dir, touched_files)

    f_lnk_out: str = f'{args.Source}/Saved/{args.Module}{F_LNK_SFX}'
    if f_lnk_out in touched_files:
        touched_files.remove(f_lnk_out)

    if len(touched_files) == 0:
        raise RuntimeError('No files copied.')

    # p_nm_args: list[str] = ['llvm-nm']
    # p_nm_args.extend(touched_files)
    # p_nm_args.extend(['grep', 'png_read_filter_row_sub3_sse2'])
    # with subprocess.Popen(
    #     p_nm_args,
    #     stdout=subprocess.PIPE,
    #     stderr=subprocess.PIPE,
    #     shell=False,
    # ) as p:
    #     print(f'Executing: {" ".join(p.args)}')
    #     p.wait()
    #     print(p.stdout.read().decode('utf-8'))
    #     print(p.stderr.read().decode('utf-8'))
    #     if p.returncode != 0:
    #         raise RuntimeError(f'Failed to nm files.')


    p_args: list[str] = ['llvm-link']
    p_args.extend(touched_files)
    p_args.extend(['-o', f_lnk_out])

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
            raise RuntimeError(f'Failed to link files.')

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
