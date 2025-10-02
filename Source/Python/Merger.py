from Source.Python.Globals import Globals
from Source.Python.Exporter import Exporter, Unit
from Source.Python.Elements import UnitTypedef
from Source.Python.SqlConnection import SqlConnection


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

    unmerged_headers: list[Unit] = []
    unmerged_translations: list[Unit] = []
    for u in e.units:
        if u.is_header(g):
            unmerged_headers.append(u)
        else:
            unmerged_translations.append(u)
        continue

    e.units = []

    __trivial_merge_impl_header(g, unmerged_headers, e.units, e.con)
    __trivial_merge_impl_translation(g, unmerged_translations, e.units, e.con)

    return None


def __trivial_merge_impl_header(g: Globals, xs: list[Unit], out: list[Unit], con: SqlConnection) -> None:
    def create_lookup(__xs: list[Unit]) -> dict[str, list[Unit]]:
        __out: dict[str, list[Unit]] = {}
        for __x in __xs:
            __f: str = __x.elements[0].source.file.ident
            if __f not in __out:
                __out[__f] = []
            __out[__f].append(__x)
            continue
        # Ensure a deterministic order.
        return dict(sorted(__out.items(), key=lambda item: item[0]))

    cache: list[Unit] = xs

    lookup = create_lookup(cache)
    cache = []
    while len(lookup) > 0:
        _, units = lookup.popitem()
        __trivial_merge_impl_header_impl_typedef(g, units, cache, con)
        continue

    lookup = create_lookup(cache)
    cache = []
    while len(lookup) > 0:
        _, units = lookup.popitem()
        __trivial_merge_impl_header_impl_trivial_types(g, units, cache, con)
        continue

    out.extend(cache)
    return None


def __trivial_merge_impl_header_impl_typedef(g: Globals, xs: list[Unit], out: list[Unit], con: SqlConnection) -> None:
    typedefs: list[Unit] = []
    others: list[Unit] = []
    for u in xs:
        if len(u.elements) == 1 and isinstance(u.elements[0], UnitTypedef):
            typedefs.append(u)
        else:
            others.append(u)
        continue

    referenceless_typedefs: list[Unit] = []
    while len(typedefs) > 0:
        u: Unit | None = typedefs.pop(0)
        assert len(u.elements) == 1

        td: UnitTypedef = u.elements[0] # type: ignore

        u_n: int = u.get_n_size(g)

        if td.is_no_tag():
            if u.depends_only_on_trivials():
                referenceless_typedefs.append(u)
            else:
                out.append(u)
            continue

        if len(td.record_refs) == 0:
            referenceless_typedefs.append(u)
            continue

        mvp_ref = None
        if len(td.record_refs) == 1:
            r, s = next(iter(td.record_refs.items()))
            if s:
                out.append(u)
                u = None
                continue
            mvp_ref = r
        else:
            for r, s in td.record_refs.items():
                if s:
                    out.append(u)
                    u = None
                    mvp_ref = None
                    break

                if Unit.is_trivial_type(r):
                    continue

                if mvp_ref is None:
                    mvp_ref = r
                    continue

                mvp_ref = None
                out.append(u)
                u = None
                break

        if mvp_ref is None:
            if u:
                out.append(u)
                u = None
            continue

        for other_u in others:
            if u_n + other_u.get_n_size(g) >= g.args.N:
                continue

            e = other_u.get_element(mvp_ref)
            if e is None:
                continue

            other_u.merge(g, u, con)
            u = None
            break

        if u is not None:
            out.append(u)
            u = None

        continue

    out.extend(__trivial_reflexive_n_merge(g, referenceless_typedefs, con))
    out.extend(others)
    return None


def __trivial_merge_impl_header_impl_trivial_types(g: Globals, xs: list[Unit], out: list[Unit], con: SqlConnection) -> None:
    trivial: list[Unit] = []
    non_trivial: list[Unit] = []
    for u in xs:
        if u.depends_only_on_trivials():
            trivial.append(u)
        else:
            non_trivial.append(u)
        continue

    out.extend(__trivial_reflexive_n_merge(g, trivial, con))
    out.extend(non_trivial)
    return None


def __trivial_merge_impl_header_impl_circle(g: Globals, xs: list[Unit], out: list[Unit], con: SqlConnection) -> None:
    def has_circle(__refs: set[str], __units: list[Unit], __ignore: Unit | None) -> bool:
        for __u in __units:
            if __u is __ignore:
                continue
            if not __refs.isdisjoint(__u.get_strong_record_refs()):
                return True
            continue
        return False

    while len(xs) > 0:
        u: Unit | None = xs.pop(0)
        assert len(u.elements) > 0

        u_n: int = u.get_n_size(g)

        if u_n >= g.args.N or len(xs) == 0:
            out.append(u)
            continue

        for other_u in xs:
            assert len(other_u.elements) > 0

            assert u.is_header(g) == other_u.is_header(g) and u.is_header(g) == True

            other_u_n: int = other_u.get_n_size(g)
            if u_n + other_u_n >= g.args.N:
                continue

            new_refs: set[str] = u.get_strong_record_refs().union(other_u.get_strong_record_refs())
            if has_circle(new_refs, xs, other_u) or has_circle(new_refs, out, None):
                continue

            other_u.merge(g, u, con)
            u = None
            break

        if u is not None:
            out.append(u)
            u = None

        continue

    return None


def __trivial_merge_impl_translation(g: Globals, xs: list[Unit], out: list[Unit], con: SqlConnection) -> None:
    out.extend(__trivial_reflexive_n_merge(g, xs, con))
    return None


def __trivial_reflexive_n_merge(g: Globals, xs: list[Unit], con: SqlConnection) -> list[Unit]:
    out: list[Unit] = []

    while len(xs) > 0:
        u: Unit | None = xs.pop(0)
        assert len(u.elements) > 0

        u_n: int = u.get_n_size(g)

        if u_n >= g.args.N or len(xs) == 0:
            out.append(u)
            continue

        for other_u in xs:
            assert len(other_u.elements) > 0

            # Reflexive merge, so only merge files from the same files.
            if u.elements[0].source.file != other_u.elements[0].source.file:
                continue

            assert u.is_header(g) == other_u.is_header(g)

            other_u_n: int = other_u.get_n_size(g)
            if u_n + other_u_n >= g.args.N:
                continue

            other_u.merge(g, u, con)
            u = None
            break

        if u is not None:
            out.append(u)
            u = None

        continue

    return out
