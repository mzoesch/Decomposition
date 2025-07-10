import os
import json
import re
import time
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
        '-DCMAKE_BUILD_TYPE={}'.format(args.PluginConfig),
         wd=args.BuildDir
        )
    run_any_task('make', '-j$(nproc)', wd=args.BuildDir, shell=True)

    return None


def compile_to_ir(args) -> None:
    """
    Step One.
    """

    def _get_flags(inner_args, inner_target: str | None) -> str:
        if inner_target is None:
            inner_target = 'Saved'
        else:
            inner_target = f'Saved/tar-{inner_target}'
        assert( target.__contains__(' ') is False )
        return (
            f'-Xclang -load -Xclang {inner_args.ClangPlugin} -Xclang -add-plugin -Xclang {inner_args.ClangPluginName} '
                            f'{f'-Xclang -plugin-arg-{inner_args.ClangPluginName} -Xclang -WaitForDebugger ' 
            if args.Gdb 
            else            ''}'
                            f'{f'-Xclang -plugin-arg-{inner_args.ClangPluginName} -Xclang -WaitForDebuggerOnFail ' 
            if args.GdbOnFail
            else            ''}'
            f'-Xclang -plugin-arg-{inner_args.ClangPluginName} -Xclang -IrPath={inner_target}'
            )

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
                    f'-DCMAKE_C_FLAGS={_get_flags(args, None)}',
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
                rc: int = run_any_task_ok_to_fail(
                    'cmake',
                    '--build',
                    args.TargetBuildDir,
                    '-v' if args.VerboseOutput else ''
                    )
            else:
                rc: int = run_any_task_ok_to_fail(
                    'cmake',
                    '--build',
                    args.TargetBuildDir
                    )
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

            if (args.ExtractedIndex is None) and (args.AllExtractedTargets is False):
                if (args.SplitTarget is not None) and (args.IgnoreSplitTarArg is False):
                    pass
                else:
                    print('Fetched Targets:')
                    for i, (target, entries) in reversed(list(enumerate(sorted_targets))):
                        print(f'[{i}] {target} ({len(entries)} files)')
                        for e in entries[:3]:
                            print(f'        {e['file']}')
                        if len(entries) > 3:
                            print('        ...')


            if args.AllExtractedTargets:
                cwd = os.getcwd()
                last_entry_name = None
                last_entry = None
                reached_last_entry = False
                try:
                    t_cursor: int = 1
                    for target_name, entries in sorted_targets:
                        last_entry_name = target_name
                        Exporter.append_analyzed_target(target_name)
                        e_cursor: int = 1
                        for entry in entries:
                            last_entry = entry
                            print(f'[{t_cursor:0{len(str(len(sorted_targets)))}}/{len(sorted_targets)}] '
                                  f'[{e_cursor:0{len(str(len(entries)))}}/{len(entries)}]', end=' ')
                            if args.VerboseOutput is False:
                                print(f'Analysing: {entry['file']} ... ', end='', flush=True)
                            my_dir: str = entry['directory']
                            Exporter.add_wd_mapping(target_name, my_dir)
                            command: str = f'{entry['command']} {_get_flags(args, target_name)}'
                            os.chdir(my_dir)
                            run_any_task(command, shell=True, verbose=args.VerboseOutput)
                            print('done')

                            e_cursor += 1
                            continue

                        t_cursor += 1
                        continue

                    reached_last_entry = True

                finally:
                    os.chdir(cwd)
                    if reached_last_entry is False:
                        if last_entry is not None:
                            print(f'FAIL: {last_entry["file"]}')
                            print(f'FAIL:     WD: {last_entry["directory"]}')
                            print(f'FAIL:     {last_entry['command']} {_get_flags(args, last_entry_name)}')

            else:
                if args.ExtractedIndex is not None:
                    selection = args.ExtractedIndex
                elif (args.SplitTarget is not None) and (args.IgnoreSplitTarArg is False):
                    selection = None
                    for i in range(len(sorted_targets)):
                        if sorted_targets[i][0] == args.SplitTarget:
                            selection = i
                            break
                        continue
                    if selection is None:
                        print(f'No such target [{args.SplitTarget}].')
                        exit(1)
                else:
                    selection = input('Select by index: ').strip()

                try:
                    selection = int(selection)
                    target_name, selected_entries = sorted_targets[selection]
                except (ValueError, IndexError):
                    print(f'Invalid selection [{selection}].')
                    exit(1)

                Exporter.append_analyzed_target(target_name)

                cwd = os.getcwd()
                last_entry = None
                reached_last_entry = False
                try:
                    e_cursor: int = 1
                    for entry in selected_entries:
                        last_entry = entry
                        print(f'[{e_cursor:0{len(str(len(selected_entries)))}}/{len(selected_entries)}]', end=' ')
                        if args.VerboseOutput is False:
                            print(f'Analysing: {entry['file']} ...', end=' ', flush=True)
                        my_dir: str = entry['directory']
                        Exporter.add_wd_mapping(target_name, my_dir)
                        command: str = f'{entry['command']} {_get_flags(args, target_name)}'
                        os.chdir(my_dir)
                        run_any_task(command, shell=True, verbose=args.VerboseOutput)
                        print('done')

                        e_cursor += 1
                        continue

                    reached_last_entry = True

                finally:
                    os.chdir(cwd)
                    if reached_last_entry is False:
                        if last_entry is not None:
                            print(f'FAIL: {last_entry["file"]}')
                            print(f'FAIL:     WD: {last_entry["directory"]}')
                            print(f'FAIL:     {last_entry['command']} {_get_flags(args, target_name)}')

    else:
        run_any_task(args.BuildCommand, shell=True)

    return None


def retrieve_wd_mapping(args) -> None:
    if args.UseCMake is False:
        return None

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

    for x in targets:
        for entry in targets[x]:
            Exporter.add_wd_mapping(x, entry['directory'])

        continue

    return None


def split(args, split_target) -> None:
    """
    Step Two.
    """

    print(f'Splitting target [{split_target}] ...')

    Exporter.set_current_target(split_target)

    if args.ClearOut:
        _clear_out_dir(Exporter.get_out_dir_s(args))

    with open(Exporter.get_intermediate_file_s(args), 'r') as f: # Check that the intermediate file is valid
        pass

    split_impl(args)

    Exporter.set_current_target(None)

    return None


def compile(args, compiler_target) -> None:
    """
    Step Three.
    """

    print(f'Compiling target [{compiler_target}] ...')

    Exporter.set_current_target(compiler_target)

    bin_dir = Exporter.get_bin_dir_s(args)
    if os.path.exists(bin_dir) is False:
        os.makedirs(bin_dir)
    if os.path.isdir(bin_dir) is False:
        raise ValueError(f'No such directory [{bin_dir}].')

    if args.ClearBinOut:
        removed: int = 0
        for f in os.listdir(bin_dir):
            if f.endswith('.o'):
                file_path: str = os.path.join(args.TargetBuildBinDir, f)
                if os.path.isfile(file_path):
                    os.remove(file_path)
                    removed += 1
            continue

        if removed > 0:
            print(f'Removed {removed} files from [{bin_dir}].')

    compile_impl(args)

    Exporter.set_current_target(None)

    return None


def default_parse_args() -> None:
    """
    Default entry point with default args detection.
    """

    start_time = time.perf_counter()

    import sys
    import argparse

    parser = argparse.ArgumentParser(description='Wrapper around the Clang plugin for automation of various tasks.')


    group = parser.add_argument_group('Shared arguments')
    group.add_argument('-ClangCompiler',       type=str,                    help='Clang compiler to use. Defaults to [clang].')
    group.add_argument('-ClangCompilerXX',     type=str,                    help='Clang++ compiler to use. Defaults to [clang++].')
    group.add_argument('-VerboseOutput',       action='store_true',         help='Whether to emit verbose output. Defaults to [False].')
    group.add_argument('-TargetBuildDir',      type=str,                    help='The build dir to use. Either relative or absolute path. If used with -UseCMake the path is relative to the dir of the CMakeLists.txt file else relative to the cwd. Defaults to [build].')
    group.add_argument('-Gdb',                 action='store_true',         help='Whether to wait for gdb to be attached to the clang process. Linux only. Defaults to [False].')
    group.add_argument('-GdbOnFail',           action='store_true',         help='Whether to wait for gdb to be attached to the clang process when a process failure occurs. Linux only. Defaults to [False].')


    group = parser.add_argument_group('Step Zero: Environment setup')
    group.add_argument('-Setup',               action='store_true',         help='Setup the environment. Only run once.')
    group.add_argument('-BuildDir',            type=str,                    help='Build dir of the clang plugin. Defaults to [build].')
    group.add_argument('-PluginConfig',        type=str, default='Release', help='Plugin configuration to use. Defaults to [Release].')


    group = parser.add_argument_group('Step One: Intermediate representation')
    group.add_argument('-Analyse',             action='store_true',         help='Whether to run the analysis. (The "step one")')
    group = parser.add_argument_group('Step One: Intermediate representation (For CMake projects)')
    group.add_argument('-UseCMake',            action='store_true',         help='Whether the target is a cmake project. Defaults to [false] except if the -CMakeLocation is set. Incompatible with -BuildCommand.')
    group.add_argument('-NoCMakeSetup',        action='store_true',         help='Whether to skip the cmake setup. Defaults to [False].')
    group.add_argument('-NoExtractCMakeCmds',  action='store_true',         help='Whether to not extract cmake commands and then analyse the codebase with said commands. Defaults to [False].')
    group.add_argument('-ExtractedIndex',      type=int, default=None,      help='Index of the extracted cmake command to analyse. If -SplitTarget is defined and this not, the split target argument will be used. Defaults to [None].')
    group.add_argument('-IgnoreSplitTarArg',   action='store_true',         help='Whether to ignore the -SplitTarget argument. When -ExtractedIndex is not defined. Defaults to [False].')
    group.add_argument('-AllExtractedTargets', action='store_true',         help='Whether to analyse all extracted cmake command targets. Incompatible with -ExtractedIndex. Defaults to [False].')
    group.add_argument('-CMakeLocation',       type=str,                    help='CMake location to use. Required if -UseCMake is set.')
    group.add_argument('-CMakeArgs',           nargs='*', type=str,         help='CMake arguments to pass. Defaults to [[]].')
    group.add_argument('-ClangPlugin',         type=str,                    help='Clang plugin to run. Defaults to [Binaries/Clang/libDecomposition.so].')
    group.add_argument('-ClangPluginName',     type=str,                    help='Name of plugin to run. Defaults to [decomposition].')
    group = parser.add_argument_group('Step One: Intermediate representation (For non CMake projects)')
    group.add_argument('-BuildCommand',        type=str,                    help='Custom build command to run. Incompatible with -UseCMake.')


    group = parser.add_argument_group('Step Two: Split to units')
    group.add_argument('-Split',               action='store_true',         help='Whether to split to units.')
    group.add_argument('-SplitTarget',         type=str, default=None,      help='Target to split. If not set, all targets will be split. Defaults to [None].')
    group.add_argument('-SplitWd',             type=str, default=None,      help='Working directory to use for the split. Automatically set if UseCMake is set to true. Requires explicitly setting the SplitTarget flag. Defaults to [None].')
    group.add_argument('-ClearOut',            action='store_true',         help='Whether to clear the out dir.')
    group.add_argument('-OkIfExists',          action='store_true',         help='Whether to ignore if the out files already are existing. Development only.')
    group.add_argument('-N',                   type=int, default=2048,      help='Size of N. N describes the number of non whitespace characters. Defaults to [2048].')
    group.add_argument('-RespectStatic',       action='store_true',         help='Whether to respect static free functions declarations. Defaults to [False].')
    group.add_argument('-GiveContext',         action='store_true',         help='Whether to give context inside the split units. Defaults to [False].')
    group.add_argument('-SkipMerge',           action='store_true',         help='Whether to skip the merge step. This will result in units that are minimal. Defaults to [False].')
    group.add_argument('-PurgeDeclDocs',       action='store_true',         help='Whether to purge declaration documentation. Defaults to [False].')
    group.add_argument('-PurgeInlineDocs',     action='store_true',         help='Whether to purge inline documentation. Defaults to [False].')
    group.add_argument('-CountDeclDocsToN',    action='store_true',         help='Whether to count declaration docs and comments to N. Defaults to [False].')
    group.add_argument('-CountDocsToN',        action='store_true',         help='Whether to count inline docs and comments to N. Defaults to [False].')


    group = parser.add_argument_group('Step Three: Compile units')
    group.add_argument('-Compile',             action='store_true',         help='Whether to compile the output files. Defaults to [False].')
    group.add_argument('-TargetBuildBinDir',   type=str,                    help='The bin build dir to use. Either relative or absolute path. If relative, it is relative to the TargetBuildDir/Saved/<tar>. Defaults to [Bin].')
    group.add_argument('-ClearBinOut',         action='store_true',         help='Whether to clear the bin out dir. Defaults to [False].')


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
    if args.SplitTarget is not None:
        Exporter.append_analyzed_target(args.SplitTarget)
        if args.SplitWd is not None:
            Exporter.add_wd_mapping(args.SplitTarget, args.SplitWd)

    time_cursor = start_time
    env_setup_time = None
    analysis_time = None
    split_time = None
    compile_time = None

    try:
        """
        Step Zero.
        """
        if args.Setup:
            setup_environment(args)
            env_setup_time = time.perf_counter() - time_cursor
            time_cursor = time.perf_counter()

        """
        Step One.
        """
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
            analysis_time = time.perf_counter() - time_cursor
            time_cursor = time.perf_counter()
        else:
            if args.Split or args.Compile:
                args.TargetBuildDir = _get_abs_build_dir(args)
                retrieve_wd_mapping(args)

        """
        Step Two.
        """
        if args.Split:
            if args.Analyse is False:
                args.TargetBuildDir = _get_abs_build_dir(args)
            if args.TargetBuildDir is None:
                raise ValueError('Target build dir must be set.')
            if os.path.exists(args.TargetBuildDir) is False or os.path.isdir(args.TargetBuildDir) is False:
                raise ValueError(f'No such directory [{args.TargetBuildDir}].')
            assert( len(Exporter._analyzed_targets) > 0 )
            for tar in Exporter._analyzed_targets:
                split(args=args, split_target=tar)
                continue
            split_time = time.perf_counter() - time_cursor
            time_cursor = time.perf_counter()

        """
        Step Three.
        """
        if args.Compile:
            if args.TargetBuildDir is None:
                raise ValueError('Target build dir must be set.')
            if os.path.exists(args.TargetBuildDir) is False or os.path.isdir(args.TargetBuildDir) is False:
                raise ValueError(f'No such directory [{args.TargetBuildDir}].')
            assert( len(Exporter._analyzed_targets) > 0 )
            for tar in Exporter._analyzed_targets:
                compile(args=args, compiler_target=tar)
                continue
            compile_time = time.perf_counter() - time_cursor
            time_cursor = time.perf_counter()

            return None

    finally:

        def format_duration(seconds):
            seconds = int(seconds)
            hours, remainder = divmod(seconds, 3600)
            minutes, seconds = divmod(remainder, 60)
            parts = []
            if hours > 0:
                parts.append(f'{hours}h')
            if minutes > 0 or hours > 0:
                parts.append(f'{minutes}m')
            parts.append(f'{seconds}s')
            return ' '.join(parts)

        if env_setup_time is not None:
            print(f'Environment setup time [{format_duration(env_setup_time)}].')
        if analysis_time is not None:
            print(f'Analysis time [{format_duration(analysis_time)}].')
        if split_time is not None:
            print(f'Split time [{format_duration(split_time)}].')
        if compile_time is not None:
            print(f'Compile time [{format_duration(compile_time)}].')

        print(f'Total execution time [{format_duration(time.perf_counter() - start_time)}].')


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


def _clear_out_dir(path: str) -> None:
    if not os.path.exists(path):
        return None

    removed: int = 0
    for f in os.listdir(path):
        if f.endswith('.c') or f.endswith('.h') or f.endswith('.fwd') or f.endswith('.inc') or f.endswith('.ctx'):
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
