import os
import json
import re
from collections import defaultdict
from Source.Python.Exporter import Exporter
from Source.Python.Split import split_impl
from Source.Python.Tasks import run_any_task, run_any_task_ok_to_fail
from Source.Python.Compiler import compile_impl


def setup_environment(args) -> None:
    """
    Step Zero.
    """

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
    """
    Step One.
    """

    def _get_flags(inner_args) -> str:
        return (f'-Xclang -load -Xclang {inner_args.ClangPlugin} -Xclang -add-plugin -Xclang {inner_args.ClangPluginName} '
                f'{f'-Xclang -plugin-arg-{inner_args.ClangPluginName} -Xclang -WaitForDebugger' if args.Gdb else ''}'
                f'{f'-Xclang -plugin-arg-{inner_args.ClangPluginName} -Xclang -WaitForDebuggerOnFail' if args.GdbOnFail else ''}')

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
            if args.NoExtractCMakeCmds:
                run_any_task(
                    'cmake',
                    '-S', os.path.abspath(args.CMakeLocation),
                    '-B', os.path.abspath(args.TargetBuildDir),
                    f'-DCMAKE_C_COMPILER={args.ClangCompiler}',
                    '-DCMAKE_C_COMPILER_WORKS=TRUE',
                    '-DCMAKE_CXX_COMPILER_WORKS=TRUE',
                    f'-DCMAKE_C_FLAGS={_get_flags(args)}',
                    *args.CMakeArgs
                )
            else:
                run_any_task(
                    'cmake',
                    '-S', os.path.abspath(args.CMakeLocation),
                    '-B', os.path.abspath(args.TargetBuildDir),
                    f'-DCMAKE_C_COMPILER={args.ClangCompiler}',
                    '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON',
                    *args.CMakeArgs
                    )

        if not os.path.exists(args.TargetBuildDir) or not os.path.isdir(args.TargetBuildDir):
            raise ValueError(f'No such directory [{args.TargetBuildDir}].')

        if args.NoExtractCMakeCmds:
            # This will generate the Saved/IR.json through the CMAKE_C_FLAGS.
            if args.VerboseOutput:
                rc: int = run_any_task_ok_to_fail('cmake', '--build', args.TargetBuildDir, '-v' if args.VerboseOutput else '')
            else:
                rc: int = run_any_task_ok_to_fail('cmake', '--build', args.TargetBuildDir)
            assert( rc == 0 )

        else:
            compile_command_file = os.path.join(args.TargetBuildDir, 'compile_commands.json')
            if not os.path.exists(compile_command_file) or not os.path.isfile(compile_command_file):
                raise ValueError(f'No such file [{compile_command_file}].')
            with open(compile_command_file, 'r') as f:
                cmds = json.load(f)

            targets = defaultdict(list)

            for entry in cmds:
                cmd = entry['command']
                match = re.search(r'-o\s+.*CMakeFiles/([^/]+)\.dir/', cmd)
                if match:
                    target = match.group(1)
                    targets[target].append(entry)
                else:
                    targets['_unknown'].append(entry)

            sorted_targets = sorted(targets.items(), key=lambda x: len(x[1]), reverse=True)

            if args.ExtractedIndex is None and args.AllExtractedTargets is False:
                print('Fetched Targets:')
                for i, (target, entries) in reversed(list(enumerate(sorted_targets))):
                    print(f'[{i}] {target} ({len(entries)} files)')
                    for e in entries[:3]:
                        print(f'        {e['file']}')
                    if len(entries) > 3:
                        print('        ...')

            if args.AllExtractedTargets:
                cwd = os.getcwd()
                try:
                    for c in cmds:
                        dir: str = c['directory']
                        command: str = f'{c['command']} {_get_flags(args)}'
                        os.chdir(dir)
                        run_any_task(command, shell=True)
                finally:
                    os.chdir(cwd)

            else:
                if args.ExtractedIndex is not None:
                    selection = args.ExtractedIndex
                else:
                    selection = input('Select by index: ').strip()

                try:
                    selection = int(selection)
                    target_name, selected_entries = sorted_targets[selection]
                except (ValueError, IndexError):
                    print(f'Invalid selection [{selection}].')
                    exit(1)

                cwd = os.getcwd()
                last_entry = None
                reached_last_entry = False
                try:
                    for entry in selected_entries:
                        last_entry = entry
                        if args.VerboseOutput is False:
                            print(f'Analysing: {entry['file']}')
                        my_dir: str = entry['directory']
                        Exporter.cached_wd_for_ir = my_dir
                        command: str = f'{entry['command']} {_get_flags(args)}'
                        os.chdir(my_dir)
                        run_any_task(command, shell=True, verbose=args.VerboseOutput)
                        continue

                    reached_last_entry = True

                finally:
                    os.chdir(cwd)
                    if reached_last_entry is False:
                        if last_entry is not None:
                            print(f'FAIL: {last_entry["file"]}')
                            print(f'FAIL:     WD: {last_entry["directory"]}')
                            print(f'FAIL:     {last_entry['command']} {_get_flags(args)}')

    else:
        run_any_task(args.BuildCommand, shell=True)

    return None


def split(args) -> None:
    """
    Step Two.
    """

    if args.ClearOut:
        _clear_out_dir(Exporter.get_out_dir_s(args))

    with open(Exporter.get_intermediate_file_s(args), 'r') as f: # Check that the intermediate file is valid
        pass

    split_impl(args)

    return None


def compile(args) -> None:
    """
    Step Three.
    """

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
    """
    Default entry point with default args detection.
    """

    import sys
    import argparse

    parser = argparse.ArgumentParser(description='Wrapper around the Clang plugin for automation of various tasks.')


    group = parser.add_argument_group('Shared arguments')
    group.add_argument('-ClangCompiler',       type=str,                 help='Clang compiler to use. Defaults to [clang].')
    group.add_argument('-ClangCompilerXX',     type=str,                 help='Clang++ compiler to use. Defaults to [clang++].')
    group.add_argument('-VerboseOutput',       action='store_true',      help='Whether to emit verbose output. Defaults to [False].')
    group.add_argument('-TargetBuildDir',      type=str,                 help='The build dir to use. Either relative or absolute path. If used with -UseCMake the path is relative to the dir of the CMakeLists.txt file else relative to the cwd. Defaults to [build].')
    group.add_argument('-Gdb',                 action='store_true',      help='Whether to wait for gdb to be attached to the clang process. Linux only. Defaults to [False].')
    group.add_argument('-GdbOnFail',           action='store_true',      help='Whether to wait for gdb to be attached to the clang process when a process failure occurs. Linux only. Defaults to [False].')

    group = parser.add_argument_group('Step Zero: Environment setup')
    group.add_argument('-Setup',               action='store_true',      help='Setup the environment. Only run once.')
    group.add_argument('-BuildDir',            type=str,                 help='Build dir of the clang plugin. Defaults to [build].')


    group = parser.add_argument_group('Step One: Intermediate representation')
    group.add_argument('-Analyse',             action='store_true',      help='Whether to run the analysis. (The "step one")')
    group = parser.add_argument_group('Step One: Intermediate representation (For CMake projects)')
    group.add_argument('-UseCMake',            action='store_true',      help='Whether the target is a cmake project. Defaults to [True]. Incompatible with -BuildCommand.')
    group.add_argument('-NoCMakeSetup',        action='store_true',      help='Whether to skip the cmake setup. Defaults to [False].')
    group.add_argument('-NoExtractCMakeCmds',  action='store_true',      help='Whether to not extract cmake commands and then analyse the codebase with said commands. Defaults to [False].')
    group.add_argument('-ExtractedIndex',      type=int, default=None,   help='Index of the extracted cmake command to analyse. Defaults to [None].')
    group.add_argument('-AllExtractedTargets', action='store_true',      help='Whether to analyse all extracted cmake command targets. Defaults to [False].')
    group.add_argument('-CMakeLocation',       type=str,                 help='CMake location to use. Required if -UseCMake is set.')
    group.add_argument('-CMakeArgs',           nargs='*', type=str,      help='CMake arguments to pass. Defaults to [[]].')
    group.add_argument('-ClangPlugin',         type=str,                 help='Clang plugin to run. Defaults to [Binaries/Clang/libDecomposition.so].')
    group.add_argument('-ClangPluginName',     type=str,                 help='Name of plugin to run. Defaults to [decomposition].')
    group = parser.add_argument_group('Step One: Intermediate representation (For non CMake projects)')
    group.add_argument('-BuildCommand',        type=str,                 help='Custom build command to run. Incompatible with -UseCMake.')


    group = parser.add_argument_group('Step Two: Split to units')
    group.add_argument('-Split',               action='store_true',       help='Whether to split to units.')
    group.add_argument('-CachedExporterDir',   type=str, default=None,    help='Cached exporter dir to use. Some CMake projects might use different exporting directories. Defaults to [None].')
    group.add_argument('-ClearOut',            action='store_true',       help='Whether to clear the out dir.')
    group.add_argument('-OkIfExists',          action='store_true',       help='Whether to ignore if the out files already are existing. Development only.')


    group = parser.add_argument_group('Step Three: Compile units')
    group.add_argument('-Compile',             action='store_true',       help='Whether to compile the output files. Defaults to [False].')
    group.add_argument('-TargetBuildBinDir',   type=str,                  help='The bin build dir to use. Either relative or absolute path. If relative, it is relative to the TargetBuildDir/Saved. Defaults to [Bin].')
    group.add_argument('-ClearBinOut',         action='store_true',       help='Whether to clear the bin out dir. Defaults to [False].')


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
    if args.CachedExporterDir is not None:
        Exporter.cached_wd_for_ir = args.CachedExporterDir

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
            args.ClangPluginName = 'decomposition'
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
