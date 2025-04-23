import os
from Source.Python.split import get_out_dir, get_intermediate_file, split_impl
from Source.Python.tasks import run_any_task, run_any_task_ok_to_fail


def _get_default_clang_plugin() -> str: # TODO: Make this more robust by searching for the file, Win: .dll, etc.
    return os.path.abspath('Binaries/Clang/libDecomposition.so')


def _get_abs_build_dir(parsed_args) -> str:
    if parsed_args.TargetBuildDir is None:
        parsed_args.TargetBuildDir = 'build'

    if parsed_args.UseCMake:
        cwd = os.getcwd()
        if not os.path.exists(parsed_args.CMakeLocation) or not os.path.isdir(parsed_args.CMakeLocation):
            raise ValueError(f'No such directory [{parsed_args.CMakeLocation}].')
        os.chdir(parsed_args.CMakeLocation)
        out = os.path.abspath(parsed_args.TargetBuildDir)
        os.chdir(cwd)
        return out

    return parsed_args.TargetBuildDir


def _clear_out_dir(path: str) -> None:
    if os.path.exists(path) is False:
        return None

    removed: int = 0
    for f in os.listdir(path):
        if f.endswith('.c') or f.endswith('.h') or f.endswith('.fwd'):
            file_path: str = os.path.join(path, f)
            if os.path.isfile(file_path):
                os.remove(file_path)
                removed += 1
        continue

    if removed > 0:
        print(f'Removed {removed} files from [{path}].')

    return None


def setup_environment(parsed_args) -> None:
    if not os.path.exists(parsed_args.BuildDir):
        os.makedirs(parsed_args.BuildDir)

    run_any_task('cmake', '..',        wd=parsed_args.BuildDir)
    run_any_task('make', '-j$(nproc)', wd=parsed_args.BuildDir, shell=True)

    return None


def compile_to_ir(parsed_args) -> None:
    if parsed_args.UseCMake:
        if not os.path.exists(parsed_args.CMakeLocation) or not os.path.isdir(parsed_args.CMakeLocation):
            raise ValueError(f'No such directory [{parsed_args.CMakeLocation}].')

        if not parsed_args.NoCMakeSetup:
            if not os.path.exists(parsed_args.ClangPlugin) or not os.path.isfile(parsed_args.ClangPlugin):
                raise ValueError(f'No such file [{parsed_args.ClangPlugin}].')
            if not os.path.exists(parsed_args.TargetBuildDir):
                os.makedirs(parsed_args.TargetBuildDir)
            elif os.path.isdir(parsed_args.TargetBuildDir) is False:
                raise ValueError(f'No such directory [{parsed_args.TargetBuildDir}].')
            run_any_task(
                'cmake',
                '-S', parsed_args.CMakeLocation,
                '-B', parsed_args.TargetBuildDir,
                '-DCMAKE_C_COMPILER=clang',
                '-DCMAKE_C_COMPILER_WORKS=TRUE',
                '-DCMAKE_CXX_COMPILER_WORKS=TRUE',
                '-DCMAKE_C_FLAGS=-Xclang -load -Xclang {} -Xclang -plugin -Xclang {}'.format(parsed_args.ClangPlugin, parsed_args.ClangPluginName),
                *parsed_args.CMakeArgs
                )

        if not os.path.exists(parsed_args.TargetBuildDir) or not os.path.isdir(parsed_args.TargetBuildDir):
            raise ValueError(f'No such directory [{parsed_args.TargetBuildDir}].')
        rc: int = run_any_task_ok_to_fail('cmake', '--build', parsed_args.TargetBuildDir)
        assert(rc == 2)
    else:
        run_any_task(parsed_args.BuildCommand, shell=True)

    return None


def split(parsed_args) -> None:
    """Main pipeline progress."""

    if parsed_args.ClearOut:
        _clear_out_dir(get_out_dir(parsed_args))

    with open(get_intermediate_file(parsed_args), 'r') as f: # Check that the intermediate file is valid
        pass

    split_impl(parsed_args)

    return None


def default_parse_args() -> None:
    """Default entry point with default args detection."""

    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Wrapper around the LLVM Plugin.")
    parser.add_argument('-Setup',           action='store_true',      help='Setup the environment. Only run once.')
    parser.add_argument('-BuildDir',        type=str,                 help='Build dir of the clang plugin. Defaults to [build].')

    parser.add_argument('-Analyse',         action='store_true',      help='Whether to run the analysis.')
    parser.add_argument('-BuildCommand',    type=str,                 help='Custom build command to run. Incompatible with -UseCMake.')
    parser.add_argument('-TargetBuildDir',  type=str,                 help='The build dir to use. Either relative or absolute path. If used with -UseCMake the path is relative to the dir of the CMakeLists.txt file else relative to the cwd. Defaults to [build].')
    parser.add_argument('-UseCMake',        action='store_true',      help='Whether the target is a cmake project. Defaults to [True]. Incompatible with -BuildCommand.')
    parser.add_argument('-NoCMakeSetup',    action='store_true',      help='Whether to skip the cmake setup. Defaults to [False].')
    parser.add_argument('-CMakeLocation',   type=str,                 help='CMake location to use. Required if -UseCMake is set.')
    parser.add_argument('-CMakeArgs',       nargs='*', type=str,      help='CMake arguments to pass. Defaults to [[]].')
    parser.add_argument('-ClangPlugin',     type=str,                 help='Clang plugin to run. Defaults to [Binaries/Clang/libDecomposition.so].')
    parser.add_argument('-ClangPluginName', type=str,                 help='Name of plugin to run. Defaults to [decomposition-plugin].')

    parser.add_argument('-Split',          action='store_true',       help='Whether to split or just do side tasks.')
    parser.add_argument('-ClearOut',       action='store_true',       help='Whether to clear the out dir.')

    args, unknown = parser.parse_known_args(args=sys.argv[1:])

    if args.CMakeArgs is None:
        args.CMakeArgs = []
    if args.CMakeLocation is not None and args.UseCMake is False:
        args.UseCMake = True
    for arg in unknown:
        args.CMakeArgs.append(arg)

    if args.Setup:
        setup_environment(args)
    args.TargetBuildDir = _get_abs_build_dir(args)

    if args.Analyse:
        if args.BuildCommand is None and args.UseCMake is False:
            raise ValueError('Either -BuildCommand or -UseCMake must be set.')
        if args.BuildCommand is not None and args.UseCMake:
            raise ValueError('Either -BuildCommand or -UseCMake must be set, not both.')
        if args.BuildCommand is not None and args.CMakeLocation is not None:
            raise ValueError('CMake location cannot be set if -BuildCommand is set.')
        if args.UseCMake and args.CMakeLocation is None:
            raise ValueError('CMake location must be set if -UseCMake is set.')
        if args.UseCMake and args.ClangPlugin is None:
            args.ClangPlugin = _get_default_clang_plugin()
        if args.UseCMake and args.ClangPluginName is None:
            args.ClangPluginName = 'decomposition-plugin'
        compile_to_ir(parsed_args=args)

    if args.Split:
        if args.TargetBuildDir is None:
            raise ValueError('Target build dir must be set.')
        if os.path.exists(args.TargetBuildDir) is False or os.path.isdir(args.TargetBuildDir) is False:
            raise ValueError(f'No such directory [{args.TargetBuildDir}].')
        split(parsed_args=args)

    return None


if __name__ == '__main__':
    default_parse_args()
