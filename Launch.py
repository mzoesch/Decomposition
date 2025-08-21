import os
import pathlib
import sys
import argparse
import time
from pathlib import Path
from Source.Python.Globals import Globals
from Source.Python.EnvSetup import setup_environment
from Source.Python.IrCompiler import compile_to_ir
from Source.Python.Split import split_to_units
from Source.Python.Compiler import compile_units


def processed_args_entry(g: Globals) -> None:
    if g.args.DoAnalyse or g.args.DoSplit or g.args.DoCompile:
        if g.args.CMakeLocation is None:
            assert g.args.TargetBuildDir is not None, 'Target build dir must be specified for non CMake projects.'
        else:
            cwd = os.getcwd()
            if not os.path.exists(g.args.CMakeLocation) or not os.path.isdir(g.args.CMakeLocation):
                raise ValueError(f'No such directory [{g.args.CMakeLocation}].')
            os.chdir(g.args.CMakeLocation)
            out = os.path.abspath(g.args.TargetBuildDir)
            os.chdir(cwd)

            g.args.TargetBuildDir = out

    p: Path = Path(g.args.ClangPlugin)
    if not p.is_absolute():
        g.args.ClangPlugin = p.absolute()

    try:
        _guarded_processed_args_entry(g)
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

        if g.env_setup_time is not None:
            print(f'Environment setup time [{format_duration(g.env_setup_time)}].')
        if g.analysis_time is not None:
            print(f'Analysis time [{format_duration(g.analysis_time)}].')
        if g.split_time is not None:
            print(f'Split time [{format_duration(g.split_time)}].')
        if g.compile_time is not None:
            print(f'Compile time [{format_duration(g.compile_time)}].')

        print(f'Total execution time [{format_duration(time.perf_counter() - g.start_time)}].')

    return None


def default_entry() -> None:
    start_time = time.perf_counter()

    parser = argparse.ArgumentParser(description='Automation tool.')


    group = parser.add_argument_group('Shared arguments')
    group.add_argument('-ClangCompiler',        type=str, default='clang',                                  help='Clang compiler to use.')
    group.add_argument('-ClangCompilerXX',      type=str, default='clang++',                                help='Clang++ compiler to use.')
    group.add_argument('-Verbose',              action='store_true',                                        help='Whether to emit verbose output. Defaults to [False].')
    group.add_argument('-Gdb',                  action='store_true',                                        help='Whether to wait for gdb to be attached to the clang process. Linux only. Defaults to [False].')
    group.add_argument('-GdbOnFail',            action='store_true',                                        help='Whether to wait for gdb to be attached to the clang process when a process failure occurs. Linux only. Defaults to [False].')
    group.add_argument('-TargetBuildDir',       type=str, default='build',                                  help='The build dir to use. Either relative or absolute path. If used with CMake the path is relative to the dir of the CMakeLists.txt file else relative to the cwd.')
    group.add_argument('-CMakeTarget',          type=str, default=None,                                     help='Target to split. If not set, all targets will be split. Defaults to [None].')
    group.add_argument('-CMakeLocation',        type=str,                                                   help='CMake location to use.')


    group = parser.add_argument_group('Step Zero: Environment setup')
    group.add_argument('-DoSetup',              action='store_true',                                        help='Setup the environment. Only run once.')
    group.add_argument('-EnvBuildDir',          type=str, default='build',                                  help='Build dir of the clang plugin.')
    group.add_argument('-EnvConfig',            type=str, default='Release',                                help='Plugin configuration to use.')


    group = parser.add_argument_group('Step One: Intermediate representation')
    group.add_argument('-DoAnalyse',            action='store_true',                                        help='Whether to run the analysis (The "step one").')
    group = parser.add_argument_group('Step One: Intermediate representation (For CMake projects)')
    group.add_argument('-SkipCMakeSetup',       action='store_true',                                        help='Whether to skip the cmake setup. Defaults to [False].')
    group.add_argument('-NoExtractCMakeCmds',   action='store_true',                                        help='Whether to not extract cmake commands and then analyse the codebase with said commands. Defaults to [False].')
    group.add_argument('-ExtractedIndex',       type=int, default=None,                                     help='Index of the extracted cmake command to analyse. If -CMakeTarget is defined and this not, the split target argument will be used. Defaults to [None].')
    group.add_argument('-IgnoreCMakeTarArg',    action='store_true',                                        help='Whether to ignore the -CMakeTarget argument. When -ExtractedIndex is not defined. Defaults to [False].')
    group.add_argument('-AllExtractedTargets',  action='store_true',                                        help='Whether to analyse all extracted cmake command targets. Incompatible with -ExtractedIndex. Defaults to [False].')
    group.add_argument('-ClangPlugin',          type=str, default='Binaries/Clang/libDecomposition.so',     help='Clang plugin to run.')
    group.add_argument('-ClangPluginName',      type=str, default='decomposition',                          help='Name of plugin to run.')
    group.add_argument('-CMakeArgs',            nargs='*', type=str,                                        help='CMake arguments to pass. Defaults to [[]].')
    group.add_argument('-NoConcurrency',        action='store_true',                                        help='Whether to prohibit concurrency. Defaults to [False].')
    group.add_argument('-NProc',                type=int, default=6,                                        help='Number of processes to use for concurrency.')
    group = parser.add_argument_group('Step One: Intermediate representation (For non CMake projects)')
    group.add_argument('-BuildCommand',         type=str,                                                   help='Custom build command to run. If this is set the CMake arguments will be ignored.')


    group = parser.add_argument_group('Step Two: Split to units')
    group.add_argument('-DoSplit',              action='store_true',                                        help='Whether to split to units.')
    group.add_argument('-ClearOut',             action='store_true',                                        help='Whether to clear the out dir. Defaults to [False].')
    group.add_argument('-SplitWd',              type=str, default=None,                                     help='Working directory to use for the split. Automatically set if CMake is used. Defaults to [None].')
    group.add_argument('-Report',               action='store_true',                                        help='Whether to do a report after splitting. Defaults to [False].')
    group.add_argument('-SkipMerge',            action='store_true',                                        help='Whether to skip the merge step. Defaults to [False].')
    group.add_argument('-OkIfExists',           action='store_true',                                        help='Whether to ignore if the out files already are existing. Development only.')
    group.add_argument('-PurgeDeclDocs',        action='store_true',                                        help='Whether to purge declaration documentation. Defaults to [False].')
    group.add_argument('-PurgeInlineDocs',      action='store_true',                                        help='Whether to purge inline documentation. Defaults to [False].')
    group.add_argument('-RespectStatic',        action='store_true',                                        help='Whether to respect static free functions declarations. Defaults to [False].')


    group = parser.add_argument_group('Step Three: Compile units')
    group.add_argument('-DoCompile',            action='store_true',                                        help='Whether to compile the output files. Defaults to [False].')
    group.add_argument('-TargetBinDir',         type=str, default='Intermediates',                          help='The bin build dir to use. Either relative or absolute path.')
    group.add_argument('-ClearBinOut',          action='store_true',                                        help='Whether to clear the target bin out dir. Defaults to [False].')


    args, unknown = parser.parse_known_args(args=sys.argv[1:])

    if args.CMakeArgs is None:
        args.CMakeArgs = []
    for arg in unknown:
        args.CMakeArgs.append(arg)

    _globals: Globals = Globals(start_time=start_time, args=args)
    processed_args_entry(g=_globals)
    return None


def _guarded_processed_args_entry(g: Globals) -> None:
    """Guarded processing entry."""

    """
    Step Zero.
    """
    if g.args.DoSetup:
        if g.args.Verbose:
            print('Setting up environment.')
        setup_environment(g)
        g.env_setup_time = time.perf_counter() - g.time_cursor
        g.time_cursor = time.perf_counter()

    """
    Step One.
    """
    if g.args.DoAnalyse:
        if g.args.Verbose:
            print('Running analysis step.')
        if g.args.BuildCommand is not None:
            if g.args.Verbose:
                print(f'Running custom build command [{g.args.BuildCommand}].')
            os.system(g.args.BuildCommand)
        else:
            compile_to_ir(g)

        g.analysis_time = time.perf_counter() - g.time_cursor
        g.time_cursor = time.perf_counter()

    """
    Step Two.
    """
    if g.args.DoSplit:
        if g.args.Verbose:
            print('Running split step.')
        split_to_units(g)
        g.split_time = time.perf_counter() - g.time_cursor
        g.time_cursor = time.perf_counter()

    """
    Step Three.
    """
    if g.args.DoCompile:
        if g.args.Verbose:
            print('Running compile step.')
        compile_units(g)
        g.compile_time = time.perf_counter() - g.time_cursor
        g.time_cursor = time.perf_counter()

    return None


if __name__ == '__main__':
    default_entry()
