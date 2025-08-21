import os
from Source.Python.Globals import Globals
from Source.Python.Tasks import run_any_task, run_any_task_ok_to_fail
from Source.Python.Concurrency import run_concurrent
from Source.Python.CMakeTargetLoader import load_cmake_targets, pretty_print_cmake_targets


def _get_flags(g: Globals, target: str | None) -> str:
    assert target.__contains__(' ') is False

    if target is None:
        target = 'Saved'

    else:
        target = f'Saved/tar-{target}'

    return (
        f'-Xclang -load -Xclang {g.args.ClangPlugin} -Xclang -add-plugin -Xclang {g.args.ClangPluginName} '
        f'{f'-Xclang -plugin-arg-{g.args.ClangPluginName} -Xclang -WaitForDebugger '
        if g.args.Gdb
        else            ''}'
        f'{f'-Xclang -plugin-arg-{g.args.ClangPluginName} -Xclang -WaitForDebuggerOnFail '
        if g.args.GdbOnFail
        else            ''}'
        f'-Xclang -plugin-arg-{g.args.ClangPluginName} -Xclang -IrPath={target}'
        )


def _setup_cmake(g: Globals) -> None:
    if not os.path.exists(g.args.ClangPlugin) or not os.path.isfile(g.args.ClangPlugin):
        raise ValueError(f'No such file [{g.args.ClangPlugin}].')

    if not os.path.exists(g.args.TargetBuildDir):
        os.makedirs(g.args.TargetBuildDir)

    elif not os.path.isdir(g.args.TargetBuildDir):
        raise ValueError(f'No such directory [{g.args.TargetBuildDir}].')

    if g.args.NoExtractCMakeCmds:
        run_any_task(
            'cmake',
            '-S', os.path.abspath(g.args.CMakeLocation),
            '-B', os.path.abspath(g.args.TargetBuildDir),
            f'-DCMAKE_C_COMPILER={g.args.ClangCompiler}',
            '-DCMAKE_C_COMPILER_WORKS=TRUE',
            '-DCMAKE_CXX_COMPILER_WORKS=TRUE',
            f'-DCMAKE_C_FLAGS={_get_flags(g.args, None)}',
            *g.args.CMakeArgs
            )
    else:
        run_any_task(
            'cmake',
            '-S', os.path.abspath(g.args.CMakeLocation),
            '-B', os.path.abspath(g.args.TargetBuildDir),
            f'-DCMAKE_C_COMPILER={g.args.ClangCompiler}',
            '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON',
            *g.args.CMakeArgs
        )

    return None


def _analyse_target(g: Globals, target: tuple[str, list]) -> None:
    name, entries = target

    cwd = os.getcwd()

    last_entry = None
    reached_last_entry = False

    cursor: int = 1
    try:
        if g.args.NoConcurrency:
            for e in entries:
                last_entry = e
                print(f'[{cursor:0{len(str(len(entries)))}}/{len(entries)}]', end=' ')
                if g.args.Verbose is False:
                    print(f'Analysing: {e['file']} ...', end=' ', flush=True)

                my_dir: str = e['directory']
                command: str = f'{e['command']} {_get_flags(g, name)}'
                os.chdir(my_dir)
                run_any_task(command, shell=True, verbose=g.args.Verbose)
                print('done')

                cursor += 1

                continue

            reached_last_entry = True

        else:
            if len(entries) > 0:
                e = entries[0]
                last_entry = e
                print(f'[{cursor:0{len(str(len(entries)))}}/{len(entries)}]', end=' ')
                if g.args.Verbose is False:
                    print(f'Analysing: {e['file']} ...', flush=True)

                my_dir: str = e['directory']
                command: str = f'{e['command']} {_get_flags(g, name)}'
                os.chdir(my_dir)
                run_any_task(command, shell=True, verbose=g.args.Verbose)

                cursor += 1

                rs = run_concurrent(
                    g,
                    cursor,
                    len(entries),
                    g.args.NProc,
                    [(f'Analysing: {e['file']} ...', f'{e['command']} {_get_flags(g, name)}') for e in entries[1:]]
                    )
                for cmd, rc, stdout, stderr in rs:
                    if rc != 0:
                        print(f'FAIL: [{cmd}] with return code [{rc}].')

                    if g.args.Verbose:
                        print(stdout, end='')
                        if stderr:
                            print(stderr, end='')

                    continue


                reached_last_entry = True

    finally:
        os.chdir(cwd)
        if not reached_last_entry:
            if last_entry is not None:
                print(f'FAIL: {last_entry["file"]}')
                print(f'FAIL:     WD: {last_entry["directory"]}')
                print(f'FAIL:     {last_entry['command']} {_get_flags(g, name)}')

    return None


def compile_to_ir(g: Globals) -> None:
    assert g.args.CMakeLocation is not None, 'CMake location must be specified for CMake projects.'
    if not os.path.exists(g.args.CMakeLocation) or not os.path.isdir(g.args.CMakeLocation):
        raise ValueError(f'No such directory [{g.args.CMakeLocation}].')

    if not g.args.SkipCMakeSetup:
        _setup_cmake(g)

    if not os.path.exists(g.args.TargetBuildDir) or not os.path.isdir(g.args.TargetBuildDir):
        raise ValueError(f'No such directory [{g.args.TargetBuildDir}].')

    if g.args.NoExtractCMakeCmds:
        # This will generate the Saved/IR.json through the CMAKE_C_FLAGS.
        rc: int = run_any_task_ok_to_fail(
            'cmake',
            '--build',
            g.args.TargetBuildDir,
            '-v' if g.args.VerboseOutput else ''
            )
        assert rc == 0

    else:
        sorted_targets = load_cmake_targets(g)

        if (g.args.ExtractedIndex is None) and (g.args.AllExtractedTargets is False):
            if (g.args.CMakeTarget is not None) and (g.args.IgnoreCMakeTarArg is False):
                pass
            else:
                pretty_print_cmake_targets(g, sorted_targets)

        if g.args.AllExtractedTargets:
            g.split_all_targets = True
            cursor: int = 1
            for s in sorted_targets:
                print(f'[{cursor:0{len(str(len(sorted_targets)))}}/{len(sorted_targets)}]', end=' ')
                print(f'Analysing: {s[0]} ...', flush=True)
                _analyse_target(g, s)

                cursor += 1

                continue

        else:
            if g.args.ExtractedIndex is not None:
                selection = g.args.ExtractedIndex
            elif (g.args.CMakeTarget is not None) and (g.args.IgnoreCMakeTarArg is False):
                selection = None
                for i in range(len(sorted_targets)):
                    if sorted_targets[i][0] == g.args.CMakeTarget:
                        selection = i
                        break
                    continue
                if selection is None:
                    pretty_print_cmake_targets(g, sorted_targets)
                    raise ValueError(f'No such target [{g.args.CMakeTarget}].')
            else:
                selection = input('Select by index: ').strip()

            selection = int(selection)

            g.split_all_targets = False
            g.split_target = selection

            _analyse_target(g, sorted_targets[selection])

    return None
