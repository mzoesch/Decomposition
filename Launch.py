import os
from Source.Python.Exporter import Exporter
from Source.Python.Split import split_impl
from Source.Python.Tasks import run_any_task, run_any_task_ok_to_fail
from Source.Python.Compiler import compile_impl


def setup_environment(args) -> None:
    if not os.path.exists(args.BuildDir):
        os.makedirs(args.BuildDir)

    run_any_task(
        'cmake', '..',
        '-DCMAKE_C_COMPILER={}'.format(args.ClangCompiler),
        '-DCMAKE_CXX_COMPILER={}'.format(args.ClangCompilerXX),
         wd=args.BuildDir
        )
    run_any_task('make', '-j$(nproc)', wd=args.BuildDir, shell=True)

    return None


def compile_to_ir(args) -> None:
    if args.UseCMake:
        if not os.path.exists(args.CMakeLocation) or not os.path.isdir(args.CMakeLocation):
            raise ValueError(f'No such directory [{args.CMakeLocation}].')

        if not args.NoCMakeSetup:
            if not os.path.exists(args.ClangPlugin) or not os.path.isfile(args.ClangPlugin):
                raise ValueError(f'No such file [{args.ClangPlugin}].')
            if not os.path.exists(args.TargetBuildDir):
                os.makedirs(args.TargetBuildDir)
            elif os.path.isdir(args.TargetBuildDir) is False:
                raise ValueError(f'No such directory [{args.TargetBuildDir}].')
            run_any_task(
                'cmake',
                '-S', os.path.abspath(args.CMakeLocation),
                '-B', os.path.abspath(args.TargetBuildDir),
                f'-DCMAKE_C_COMPILER={args.ClangCompiler}',
                # f'-DCMAKE_CXX_COMPILER={args.ClangCompilerXX}',
                '-DCMAKE_C_COMPILER_WORKS=TRUE',
                # '-DCMAKE_CXX_COMPILER_WORKS=TRUE',
                '-DCMAKE_C_FLAGS=-Xclang -load -Xclang {} -Xclang -plugin -Xclang {}'.format(args.ClangPlugin, args.ClangPluginName),
                *args.CMakeArgs
                )

        if not os.path.exists(args.TargetBuildDir) or not os.path.isdir(args.TargetBuildDir):
            raise ValueError(f'No such directory [{args.TargetBuildDir}].')
        rc: int = run_any_task_ok_to_fail('cmake', '--build', args.TargetBuildDir)
        # assert(rc == 2)
    else:
        run_any_task(args.BuildCommand, shell=True)

    return None


def split(args) -> None:
    if args.ClearOut:
        _clear_out_dir(Exporter.get_out_dir_s(args))

    with open(Exporter.get_intermediate_file_s(args), 'r') as f: # Check that the intermediate file is valid
        pass

    split_impl(args)

    return None


def compile(args) -> None:
    if args.ClearBinOut:
        if os.path.exists(args.TargetBuildBinDir):
            removed: int = 0
            for f in os.listdir(args.TargetBuildBinDir):
                if f.endswith('.o'):
                    file_path: str = os.path.join(args.TargetBuildBinDir, f)
                    if os.path.isfile(file_path):
                        os.remove(file_path)
                        removed += 1
                continue

            if removed > 0:
                print(f'Removed {removed} files from [{args.TargetBuildBinDir}].')

    if os.path.exists(args.TargetBuildBinDir) is False:
        os.makedirs(args.TargetBuildBinDir)
    if os.path.isdir(args.TargetBuildBinDir) is False:
        raise ValueError(f'No such directory [{args.TargetBuildBinDir}].')

    compile_impl(args)

    return None


def default_parse_args() -> None:
    """Default entry point with default args detection."""

    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Wrapper around the Clang plugin.")
    parser.add_argument('-ClangCompiler',     type=str,                 help='Clang compiler to use. Defaults to [clang].')
    parser.add_argument('-ClangCompilerXX',   type=str,                 help='Clang++ compiler to use. Defaults to [clang++].')
    parser.add_argument('-VerboseOutput',     action='store_true',      help='Whether to emit verbose output. Defaults to [False].')

    parser.add_argument('-Setup',             action='store_true',      help='Setup the environment. Only run once.')
    parser.add_argument('-BuildDir',          type=str,                 help='Build dir of the clang plugin. Defaults to [build].')

    parser.add_argument('-Analyse',           action='store_true',      help='Whether to run the analysis.')
    parser.add_argument('-BuildCommand',      type=str,                 help='Custom build command to run. Incompatible with -UseCMake.')
    parser.add_argument('-TargetBuildDir',    type=str,                 help='The build dir to use. Either relative or absolute path. If used with -UseCMake the path is relative to the dir of the CMakeLists.txt file else relative to the cwd. Defaults to [build].')
    parser.add_argument('-UseCMake',          action='store_true',      help='Whether the target is a cmake project. Defaults to [True]. Incompatible with -BuildCommand.')
    parser.add_argument('-NoCMakeSetup',      action='store_true',      help='Whether to skip the cmake setup. Defaults to [False].')
    parser.add_argument('-CMakeLocation',     type=str,                 help='CMake location to use. Required if -UseCMake is set.')
    parser.add_argument('-CMakeArgs',         nargs='*', type=str,      help='CMake arguments to pass. Defaults to [[]].')
    parser.add_argument('-ClangPlugin',       type=str,                 help='Clang plugin to run. Defaults to [Binaries/Clang/libDecomposition.so].')
    parser.add_argument('-ClangPluginName',   type=str,                 help='Name of plugin to run. Defaults to [decomposition-plugin].')

    parser.add_argument('-Split',             action='store_true',       help='Whether to split or just do side tasks.')
    parser.add_argument('-ClearOut',          action='store_true',       help='Whether to clear the out dir.')
    parser.add_argument('-OkIfExists',        action='store_true',       help='Whether to ignore if the out files already are existing. Development only.')

    parser.add_argument('-Compile',           action='store_true',       help='Whether to compile the output files. Defaults to [False].')
    parser.add_argument('-TargetBuildBinDir', type=str,                  help='The bin build dir to use. Either relative or absolute path. If relative, it is relative to the TargetBuildDir/Saved. Defaults to [Bin].')
    parser.add_argument('-ClearBinOut',       action='store_true',       help='Whether to clear the bin out dir. Defaults to [False].')

    args, unknown = parser.parse_known_args(args=sys.argv[1:])

    if args.ClangCompiler is None:
        args.ClangCompiler = 'clang'
    if args.ClangCompilerXX is None:
        args.ClangCompilerXX = 'clang++'
    if args.CMakeArgs is None:
        args.CMakeArgs = []
    if args.CMakeLocation is not None and args.UseCMake is False:
        args.UseCMake = True
    for arg in unknown:
        args.CMakeArgs.append(arg)
    if args.BuildDir is None:
        args.BuildDir = 'build'
    if args.TargetBuildBinDir is None:
        args.TargetBuildBinDir = 'Bin'

    if args.Setup:
        setup_environment(args)

    if args.Analyse:
        args.TargetBuildDir = _get_abs_build_dir(args)
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
        compile_to_ir(args=args)

    if args.Split:
        if args.Analyse is False:
            args.TargetBuildDir = _get_abs_build_dir(args)
        if args.TargetBuildDir is None:
            raise ValueError('Target build dir must be set.')
        if os.path.exists(args.TargetBuildDir) is False or os.path.isdir(args.TargetBuildDir) is False:
            raise ValueError(f'No such directory [{args.TargetBuildDir}].')
        split(args=args)

    if args.Compile:
        args.TargetBuildBinDir = _get_abs_bin_build_dir(args)
        if args.TargetBuildDir is None:
            raise ValueError('Target build dir must be set.')
        if os.path.exists(args.TargetBuildDir) is False or os.path.isdir(args.TargetBuildDir) is False:
            raise ValueError(f'No such directory [{args.TargetBuildDir}].')
        if os.path.exists(args.TargetBuildBinDir) is False:
            os.makedirs(args.TargetBuildBinDir)
        if os.path.isdir(args.TargetBuildBinDir) is False:
            raise ValueError(f'No such directory [{args.TargetBuildBinDir}].')
        compile(args=args)

    return None


def _get_default_clang_plugin() -> str: # TODO: Make this more robust by searching for the file, Win: .dll, etc.
    return os.path.abspath('Binaries/Clang/libDecomposition.so')


def _get_abs_build_dir(args) -> str:
    if args.UseCMake:
        if args.TargetBuildDir is None:
            args.TargetBuildDir = 'build'
        cwd = os.getcwd()
        if not os.path.exists(args.CMakeLocation) or not os.path.isdir(args.CMakeLocation):
            raise ValueError(f'No such directory [{args.CMakeLocation}].')
        os.chdir(args.CMakeLocation)
        out = os.path.abspath(args.TargetBuildDir)
        os.chdir(cwd)
        return out

    if args.TargetBuildDir is None:
        raise ValueError('Target build dir must be set.')
    return os.path.abspath(args.TargetBuildDir)


def _get_abs_bin_build_dir(args) -> str:
    if args.TargetBuildDir is None:
        args.TargetBuildDir = _get_abs_build_dir(args)
    if args.TargetBuildBinDir is None:
        args.TargetBuildBinDir = 'Bin'

    if os.path.isabs(args.TargetBuildBinDir) is False:
        return os.path.join(args.TargetBuildDir, 'Saved', args.TargetBuildBinDir)
    return args.TargetBuildBinDir


def _clear_out_dir(path: str) -> None:
    if os.path.exists(path) is False:
        return None

    removed: int = 0
    for f in os.listdir(path):
        if f.endswith('.c') or f.endswith('.h') or f.endswith('.fwd') or f.endswith('.inc'):
            file_path: str = os.path.join(path, f)
            if os.path.isfile(file_path):
                os.remove(file_path)
                removed += 1
        continue

    if removed > 0:
        print(f'Removed {removed} files from [{path}].')

    return None


if __name__ == '__main__':
    default_parse_args()
