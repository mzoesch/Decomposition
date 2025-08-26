from Source.Python.Globals import Globals
from Source.Python.Exporter import Exporter, Unit


def merge(g: Globals, e: Exporter) -> None:
    if g.args.SkipMerge:
        print('Skipping merge step.')
        return None

    print('Running merge step ....')
    original_count = len(e.units)

    _trivial_merge(g, e)

    print(f'Finished merging [{original_count}] elements from [{original_count}] files into [{len(e.units)}] files.')

    return None


def _trivial_merge(g: Globals, e: Exporter) -> None:
    """
    Trivial merge. An easy merge, but it will not produce the optimal result.
    """

    unmerged: list[Unit] = e.units
    e.units = []
    while len(unmerged) > 0:
        u: Unit | None = unmerged.pop(0)
        assert len(u.elements) > 0

        u_n: int = u.get_n_size(g)

        if u_n >= g.args.N or len(unmerged) == 0:
            e.units.append(u)
            continue

        for other_u in unmerged:
            assert len(other_u.elements) > 0

            if (u.is_header() # <-- Because trivial.
                # Do not merge files from translation units with headers.
                or u.is_header() != other_u.is_header()):
                continue

            # As this is a trivial merge strategy, only merge files from the same files.
            if u.elements[0].source.file != other_u.elements[0].source.file:
                continue

            other_u_n: int = other_u.get_n_size(g)

            if u_n + other_u_n < g.args.N:
                other_u.merge(u)
                u = None
                break

            continue

        if u is not None:
            e.units.append(u)
            u = None

        continue

    return None
