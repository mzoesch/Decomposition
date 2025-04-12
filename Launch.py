import os
from Source.Python.split import *
from Source.Python.tasks import run_any_task

def _get_default_llvm_pass() -> str: # TODO: Make thi more robust by searching for the file, Win: .dll, etc.
    return 'Binaries/Llvm/DecompositionPass.so'


def _get_default_clang_pass() -> str: # TODO: Make thi more robust by searching for the file, Win: .dll, etc.
    return 'Binaries/Clang/libDecompositionPreprocessorPass.so'


def launch(parsed_args) -> None:
    """Main pipeline progress."""

    if parsed_args.ClearOut:
        clear_out_dir(parsed_args.DisplayName)

    if parsed_args.SkipAnalysis is False:
        for pass_name in parsed_args.LlvmPassNames:
            launch_pass(parsed_args.LlvmPass, pass_name, parsed_args.IR)

    with open(get_intermediate_file(), 'r') as f: # Check that the intermediate file is valid
        pass
    operate_on_intermediate_file(parsed_args.DisplayName, parsed_args, get_intermediate_file())

    return None


def setup_environment() -> None:
    if not os.path.exists('build'):
        os.makedirs('build')

    run_any_task('cmake', '..',           wd='build')
    run_any_task('cmake', '--build', '.', wd='build')

    return None

def default_parse_args() -> None:
    """Default entry point with default args detection."""

    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Wrapper around the LLVM Plugin.")
    parser.add_argument('-Setup',         action='store_true', help='Setup the environment. Only run once.')

    parser.add_argument('-LlvmPass',       type=str,            help='Llvm pass to run. Default to [Binaries/Llvm/DecompositionPass.so].')
    parser.add_argument('-ClangPass',      type=str,            help='Clang pass to run. Default to [Binaries/Clang/libDecompositionPreprocessorPass.so].')
    parser.add_argument('-LlvmPassNames',  nargs='+', type=str, help='Pass names to run. Default to [decomposition-plugin-sccp, decomposition-plugin-mp].')
    parser.add_argument('-ClangPassNames', nargs='+', type=str, help='Pass names to run. Default to [decomposition-plugin-preprocessor].')

    parser.add_argument('-Split',          action='store_true', help='Whether to split or just do side tasks.')
    parser.add_argument('-SkipAnalysis',   action='store_true', help='Whether to skip analysis of LLVM.')
    parser.add_argument('-ClearOut',       action='store_true', help='Whether to clear the out dir.')
    parser.add_argument('-IR',             type=str,            help='IR file to run the pass on.')
    parser.add_argument('-DisplayName',    type=str,            help='Display name of the IR.')

    parser.add_argument('-Includes',       nargs='+', type=str, help='Native includes of the C program.')

    args = parser.parse_args(sys.argv[1:])
    print(args)

    if args.Includes is None:
        args.Includes = []

    if args.Setup:
        setup_environment()

    if args.Split is False:
        return None

    if args.LlvmPass is None:
        args.LlvmPass = _get_default_llvm_pass()
    if not os.path.exists(args.LlvmPass):
        raise RuntimeError(f'No such file [{args.LlvmPass}]')
    if args.LlvmPassNames is None:
        args.LlvmPassNames = ['decomposition-plugin-sccp', 'decomposition-plugin-mp']

    if args.ClangPass is None:
        args.ClangPass = _get_default_clang_pass()
    if not os.path.exists(args.ClangPass):
        raise RuntimeError(f'No such file [{args.ClangPass}]')
    if args.ClangPassNames is None:
        args.ClangPassNames = ['decomposition-plugin-preprocessor']

    if args.IR is None:
        raise RuntimeError('-IR flag is required for splitting.')
    if args.DisplayName is None:
        args.DisplayName = args.IR.split('/')[-1].split('.')[0]
    launch(args)

    return None


if __name__ == '__main__':
    default_parse_args()
