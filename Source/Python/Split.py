import os
from pathlib import Path
from Source.Python.Globals import Globals
from Source.Python.SqlConnection import SqlConnection
from Source.Python.CMakeTargetLoader import load_cmake_targets, pretty_print_cmake_targets
from Source.Python.Exporter import Exporter
from Source.Python.Collector import collect_records, collect_typedefs, collect_variables, collect_functions
from Source.Python.Merger import merge


def split_to_units(g: Globals) -> None:
    if g.args.RepositoryLocation is not None:
        assert g.args.SplitNonCMakeTarName is not None
        _split_target_impl(g, g.args.SplitNonCMakeTarName, f'{g.args.TargetBuildDir}/Saved/tar-{g.args.SplitNonCMakeTarName}')

        return None

    _set_cmake_target_to_split(g)

    if g.split_all_targets:
        targets = load_cmake_targets(g)
        for target in targets:
            _split_target(g, target)
            continue

    elif g.split_target >= 0:
        targets = load_cmake_targets(g)
        if g.split_target >= len(targets):
            raise ValueError(f'Target index [{g.split_target}] out of range for CMake targets.')
        _split_target(g, targets[g.split_target])

    elif g.args.SplitWd is not None:
        _split_target_impl(g, 'unknown', g.args.SplitWd)

    else:
        raise ValueError('No target specified for splitting. Use -CMakeTarget when using CMake else -SplitWd.')

    return


def _set_cmake_target_to_split(g: Globals) -> None:
    if g.args.SplitWd is not None:
        return None

    assert g.args.CMakeLocation is not None
    targets = load_cmake_targets(g)

    if g.args.CMakeTarget is not None:
        found = False
        for i, (target, entries) in enumerate(targets):
            if target == g.args.CMakeTarget:
                g.split_all_targets = False
                g.split_target = i
                found = True

                break

        if not found:
            raise ValueError(f'Target [{g.args.CMakeTarget}] not found in CMake targets.')

    elif g.args.ExtractedIndex is not None:
        if g.args.ExtractedIndex >= len(targets):
            raise ValueError(f'Extracted index [{g.args.ExtractedIndex}] out of range for CMake targets.')
        g.split_all_targets = False
        g.split_target = g.args.ExtractedIndex

    elif g.split_target != -1:
        if g.split_target >= len(targets):
            raise ValueError(f'Target index [{g.split_target}] out of range for CMake targets.')
        g.split_all_targets = False

    elif not g.split_all_targets:
        pretty_print_cmake_targets(g, targets)
        selection = input('Select by index: ').strip()
        g.split_target = int(selection)

    assert g.split_all_targets or g.split_target >= 0

    return None


def _split_target(g: Globals, target: tuple[str, list]) -> None:
    name, entries = target
    if len(entries) == 0:
        print(f'No entries for target [{name}]. Skipping.')
        return None

    e = entries[0]
    directory = e['directory']

    _split_target_impl(g, name, f'{directory}/Saved/tar-{name}')

    return None


def _split_target_impl(g: Globals, display_name: str, directory: str) -> None:
    p: Path = Path(directory)
    if not p.is_absolute():
        p = p.absolute()
    if not p.exists() or not p.is_dir():
        raise ValueError(f'Directory [{p}] does not exist.')

    db: Path = p / 'ir.db'
    if not db.exists() or not db.is_file():
        raise ValueError(f'No IR database found in [{p}].')

    con: SqlConnection = SqlConnection(db)
    if not con.is_connected():
        print('WARNING: Failed to connect to the IR database. Skipping split.')
        return None

    _split(g, display_name, directory, con)

    con.close()

    return None


def _split(g: Globals, display_name: str, directory: str, con: SqlConnection) -> None:
    e: Exporter = Exporter(g, display_name, directory, con)

    print('Collecting records ...', end=' ', flush=True)
    collect_records(g, e)
    print(f'done with [{e.stats.original_record_count}] records.')

    print('Collecting typedefs ...', end=' ', flush=True)
    collect_typedefs(g, e)
    print(f'done with [{e.stats.original_typedef_count}] typedefs.')

    print('Collecting variables ...', end=' ', flush=True)
    collect_variables(g, e)
    print(f'done with [{e.stats.original_variable_count}] variables.')

    print('Collecting functions ...', end=' ', flush=True)
    collect_functions(g, e)
    print(f'done with [{e.stats.original_function_count}] functions.')

    e.gather_unit_content()
    e.gather_unit_refs()

    e.stats.max_unit_count = len(e.units)

    merge(g, e)

    if g.args.ClearOut:
        print('Clearing output directory ...', end=' ', flush=True)
        _clear_out_dir(g, e)

    print('Exporting units ...', flush=True)
    e.export_units()
    print('Exporting units ... done')

    if g.args.Report:
        e.report()

    return None


def _clear_out_dir(g: Globals, e: Exporter) -> None:
    p: Path = e.get_out_dir()

    if not os.path.exists(p):
        return None

    removed: int = 0
    for f in os.listdir(p):
        if f.endswith('.c') or f.endswith('.h') or f.endswith('.fwd') or f.endswith('.inc') or f.endswith('.ctx'):
            file_path: str = os.path.join(p, f)
            if os.path.isfile(file_path):
                os.remove(file_path)
                removed += 1
        continue

    if removed > 0:
        print(f'Removed {removed} files from [{p}].')

    return None
