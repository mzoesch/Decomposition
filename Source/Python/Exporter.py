from __future__ import annotations
import json
import os
import time
import warnings
from pathlib import Path
from Source.Python.Globals import Globals
from Source.Python.SqlConnection import SqlConnection
from Source.Python.StatTrack import StatTrack
from Source.Python.Locations import SourceFile
from Source.Python.Elements import UnitElement, UnitVariable, UnitWrap


class Unit:
    """
    The actual unit that is exported.
    """

    def __init__(self):
        self.elements: list[UnitElement] = []
        self.output_ident: str | None = None
        self.master_ext: str | None = None

        self.content: str | None = None
        self.ctx_content: str | None = None

        self.record_refs: dict[str, bool] = {}
        self.var_refs: set[str] = set()
        self._strong_record_refs_cache: set[str] | None = None

    def get_human_readable_name(self) -> str:
        assert len(self.elements) > 0
        human_readable_name: str = ''
        for s in self.elements:
            if len(human_readable_name) > 0:
                human_readable_name += '; '
            human_readable_name += s.get_human_readable_display_name()
        return human_readable_name

    def is_output_ident_valid(self) -> bool:
        return self.output_ident is not None and self.output_ident != ''

    def is_content_valid(self) -> bool:
        return self.content is not None

    @warnings.deprecated("Use is_impl_file.")
    def is_translation(self, g: Globals) -> bool:
        return self.is_impl_file(g)

    def is_impl_file(self, g: Globals) -> bool:
        assert len(self.elements) > 0
        return self.elements[0].is_impl_file(g)

    def is_header(self, g: Globals) -> bool:
        return not self.is_impl_file(g)

    def get_filename(self) -> str:
        assert self.is_output_ident_valid()
        return f'{self.output_ident}{self.master_ext}'

    def get_ctx_filename(self) -> str:
        assert self.output_ident is not None
        return f'.{self.output_ident}.ctx'

    def get_element(self, ident: str) -> UnitElement | None:
        for e in self.elements:
            if e.ident == ident:
                return e
        return None

    def get_element_asserted(self, ident: str) -> UnitElement:
        e = self.get_element(ident)
        assert e is not None
        return e

    def get_n_size(self, g: Globals) -> int:
        out: int = 0
        for e in self.elements:
            if g.args.CountDeclDocsToN:
                out += e.decl_doc_n
            out += e.content_n
            continue

        return out

    def cache_content(self, g: Globals, con: SqlConnection) -> None:
        for e in self.elements:
            e.cache_content(g, con)
            continue

        for e in self.elements:
            e.update_n(g)
            continue

        return None

    def update_refs(self, g: Globals, con: SqlConnection) -> None:
        for e in self.elements:
            e.update_refs(g, con)
            continue

        self.record_refs = {}
        self.var_refs = set()
        self._strong_record_refs_cache = None

        for e in self.elements:
            for r, strong in e.record_refs.items():
                existing = self.record_refs.get(r)
                if existing is None:
                    self.record_refs[r] = strong
                else:
                    self.record_refs[r] = existing or strong
                continue

            for v in e.var_refs:
                self.var_refs.add(v)
            continue

        return None

    def get_strong_record_refs(self) -> set[str]:
        if self._strong_record_refs_cache is None:
            self._strong_record_refs_cache = { r for r, strong in self.record_refs.items() if strong }
        return self._strong_record_refs_cache

    def create_content(self, g: Globals, ex: Exporter, con: SqlConnection) -> None:
        assert (self.content is None) and (self.ctx_content is None)
        self.content = f'#include "{self.get_ctx_filename()}"\n'
        self.ctx_content = ''

        unique_source_files: set[SourceFile] = set()
        for e in self.elements:
            assert e.source.file is not None
            unique_source_files.add(e.source.file)
            continue

        for e in self.elements:
            if not g.args.PurgeDeclDocs:
                if len(e.decl_doc) > 0:
                    self.content += '\n'
                    self.content += e.decl_doc
                    self.content += '\n'

            if len(e.content) > 0:
                if g.args.PurgeDeclDocs or len(e.decl_doc) == 0:
                    self.content += '\n'
                self.content += e.content
                self.content += '\n'

            continue

        fwds: set[str] = set()
        fwds_refs: dict[str, list[str]] = {}
        inc: set[str] = set()
        for e in self.elements:
            if isinstance(e, UnitVariable):
                var_type = Unit.remove_cv_ptr_arr(e.ty)
                if not Unit.is_trivial_type(var_type):
                    x = ex.find_unit_from_element(var_type)
                    if x is not None:
                        u, var_type = x
                        assert u.is_output_ident_valid()
                        r_ref = u.get_element_asserted(var_type)
                        _fwd = r_ref.get_forward_declaration(g, var_type)
                        if _fwd:
                            fwds.add(_fwd)
                        if u is not self:
                            inc.add(u.get_filename())

            for r, strong in list(self.record_refs.items()):
                r = Unit.remove_cv_ptr_arr(r)
                if Unit.is_trivial_type(r):
                    continue

                x = ex.find_unit_from_element(r)
                if x is None:
                    continue
                u, r = x
                assert u.is_output_ident_valid()

                r_ref = u.get_element_asserted(r)

                # ignore_strong = False
                # if isinstance(e, UnitTypedef):
                #     if not e.tag_record is None:
                #         ignore_strong = True

                if (strong is False) or (u is self):
                    _fwd = r_ref.get_forward_declaration(g, r)
                    if _fwd:
                        if not (_fwd in fwds_refs):
                            fwds_refs[_fwd] = []
                            for _ref in r_ref.record_refs.keys():
                                fwds_refs[_fwd].append(_ref)
                                continue
                        continue
                    if u is self:
                        continue

                if u.is_translation(g):
                    assert False, 'Cannot reference another translation unit strongly.'

                inc.add(u.get_filename())
                continue

            for r in self.var_refs:
                x = ex.find_unit_from_element(r)
                if x is None: # Std, <builtin>, ...
                    continue
                u, r = x

                # It is ok if this references itself.
                r_ref = u.get_element_asserted(r)
                _fwd = r_ref.get_forward_declaration(g, r)
                if _fwd:
                    fwds.add(_fwd)
                else:
                    print(f'ERROR fwd var {r}')
                fwds.add(_fwd)
                continue

            continue

        # TODO: Fix forwards with references.
        for _fwd, _refs in list(fwds_refs.items()):
            fwds.add(_fwd)
            continue

        if len(inc) > 0:
            self.ctx_content += '\n/* Includes */\n'
            for i in sorted(inc):
                self.ctx_content += f'#include "{i}"\n'
                continue

        seen_macros: set[tuple[str, str]] = set()
        for f in unique_source_files:
            con.execute_ro("""
            SELECT Identifier, bFunctionLike, Definition, Params FROM SeenMacros
            WHERE Source = ?
            ;""", (f.ident,))

            rows = con.fetchall()
            for ident, function_like, definition, params in rows:
                function_like = bool(function_like)
                seen_macros.add((ident, Unit.create_macro_definition_directive(ident, function_like, definition, params)))
                continue
            continue

        fs = self.get_foreign_stuff(con)
        if len(fs) > 0:
            self.ctx_content += '\n/* Foreign */\n'
        for ty, val in fs:
            if ty == 'include':
                self.ctx_content += f'#include "{val}"\n'
            elif ty == 'macro':
                self.ctx_content += val
                self.ctx_content += '\n'
            else:
                assert False

        reflexive_fwds: set[str] = set()
        for e in self.elements:
            fwd = e.get_forward_declaration(g, '')
            if fwd is not None:
                reflexive_fwds.add(fwd)
            continue

        fwds_list = list(fwds) # Deterministic order.
        fwds_list.sort()
        if len(fwds_list) > 0:
            self.ctx_content += '\n/* Forwards */\n'
        for fwd in fwds_list:
            if fwd is None:
                continue
            if ('(' in fwd ) or (')' in fwd): # See #Concept in thesis.
                continue
            if fwd in reflexive_fwds:
                continue
            self.ctx_content += fwd
            self.ctx_content += '\n'
            continue
        for fwd in fwds_list:
            if fwd is None:
                continue
            if not (('(' in fwd ) or (')' in fwd)):
                continue
            if fwd in reflexive_fwds:
                continue
            self.ctx_content += fwd
            self.ctx_content += '\n'
            continue
        for fwd in fwds_list:
            if fwd is None:
                continue
            if fwd not in reflexive_fwds:
                continue
            self.ctx_content += fwd
            self.ctx_content += '\n'
            continue

        if len(seen_macros) > 0:
            self.ctx_content += '\n/* Seen */\n'
            seen_macros_list: list[tuple[str, str]] = [m for m in seen_macros]
            seen_macros_list.sort(key=lambda x: x[0])
            for i, m in seen_macros_list:
                self.ctx_content += f'#ifndef {i}\n    {m}\n#endif /* {i} */\n'
                continue
            self.ctx_content += '\n'

        if self.is_header(g):
            self.content = Unit.create_guard(self.content, self.get_output_ident_guard())
        self.ctx_content = Unit.create_double_inclusion_error(self.ctx_content, self.get_output_ident_guard_ctx())

        return None

    def get_output_ident_guard(self) -> str:
        assert self.output_ident is not None
        return f'{self.output_ident.upper()}_{self.master_ext[1:].upper()}'

    def get_output_ident_guard_ctx(self) -> str:
        return f'{self.get_output_ident_guard()}_CTX'

    def merge(self, g: Globals, o: Unit, con: SqlConnection) -> None:
        for o_e in o.elements:
            added: bool = False

            for i, e in enumerate(self.elements):
                assert added is False

                if o_e.source.file != e.source.file:
                    continue

                if o_e.source.line < e.source.line:
                    self.elements.insert(i, o_e)
                    added = True
                    break

                if len(self.elements) == i + 1:
                    continue

                next_e = self.elements[i + 1]
                if next_e.source.file != e.source.file:
                    self.elements.insert(i + 1, o_e)
                    added = True
                    break

                continue

            if not added:
                self.elements.append(o_e)

            continue

        self.update_refs(g, con)

        return None

    def depends_only_on_trivials(self) -> bool:
        for r, _ in list(self.record_refs.items()):
            if Unit.is_trivial_type(r):
                continue
            return False
        return True

    @staticmethod
    def create_guard(content: str, name: str) -> str:
        return f'#ifndef {name}\n#define {name}\n\n{content}\n#endif /* {name} */\n'

    @staticmethod
    def create_double_inclusion_error(content: str, name: str) -> str:
        return f'#ifdef {name}\n    #error {name} is already defined.\n#endif /* {name} */\n#define {name}\n\n{content}'

    def get_foreign_stuff(self, con: SqlConnection) -> list[tuple[str, str]]:
        out: list[tuple[str, str]] = []

        search: dict[str, int] = {}
        for e in self.elements:
            search_element = search.get(e.source.file.ident)
            if search_element is None:
                search[e.source.file.ident] = e.source.line
            else:
                if e.source.line > search_element:
                    search[e.source.file.ident] = e.source.line
            continue

        for ident, until in search.items():
            visited_set: list[str] = []
            self._get_foreign_stuff(visited_set, out, ident, until, con)
            continue

        return out

    @staticmethod
    @DeprecationWarning
    def remove_quals_from_type(ty: str) -> str:
        ty = ty.strip()

        if ('[' in ty) and ty.endswith(']'):
            ty = ty[:ty.rfind('[')].strip()
            return Unit.remove_quals_from_type(ty)

        if ty.startswith('const '):
            ty = ty[6:].strip()
            return Unit.remove_quals_from_type(ty)

        if ty.startswith('volatile '):
            ty = ty[9:].strip()
            return Unit.remove_quals_from_type(ty)

        return ty

    @staticmethod
    def remove_cv_ptr_arr(ty: str) -> str:
        ty = ty.strip()

        if ty.startswith('const ') or ty.startswith('const*'):
            return Unit.remove_cv_ptr_arr(ty[5:])
        if ty.startswith('volatile ') or ty.startswith('volatile*'):
            return Unit.remove_cv_ptr_arr(ty[8:])
        if ty.endswith(']') and ('[' in ty):
            return Unit.remove_cv_ptr_arr(ty[:ty.rfind('[')])
        if ty.startswith('*'):
            return Unit.remove_cv_ptr_arr(ty[1:])
        if ty.endswith('*'):
            return Unit.remove_cv_ptr_arr(ty[:-1])

        return ty

    @staticmethod
    def is_trivial_type(ty: str) -> bool:
        trivials = [
            'void',
            'bool',
            'char', 'unsigned char', 'signed char',
            'short', 'unsigned short', 'signed short',
            'int', 'unsigned', 'unsigned int', 'signed', 'signed int',
            'long', 'unsigned long', 'signed long',
            'float', 'double',
            'size_t', 'ptrdiff_t', 'ssize_t', 'intptr_t', 'uintptr_t',
            'wchar_t', 'char16_t', 'char32_t',
            ]
        return Unit.remove_cv_ptr_arr(ty) in trivials

    @staticmethod
    def create_macro_definition_directive(ident: str, function_like: bool, definition: str, params: str) -> str:
        if function_like:
            return f'#define {ident}({params.replace('__VA_ARGS__', '...')}){definition}'
        else:
            return f'#define {ident}{definition}'

    def _get_foreign_stuff(self, visited_set: list[str], export_set: list[tuple[str, str]], start: str, until: int, con: SqlConnection) -> None:
        if start in visited_set:
            return None
        visited_set.append(start)

        con.execute_ro("""
        SELECT What, Line, Native, bForeign FROM IncludeDirectives
        WHERE Source = ?
        ORDER BY Line
        ;""", (start,))
        inc_rows = con.fetchall()

        con.execute_ro("""
        SELECT Identifier, Line, bFunctionLike, Definition, Params FROM Macros
        WHERE Source = ?
        ORDER BY Line
        """, (start,))
        macro_rows = con.fetchall()

        inc_cursor: int = 0
        macro_cursor: int = 0

        line_cursor: int = -1
        while inc_cursor < len(inc_rows) or macro_cursor < len(macro_rows):
            if until != -1 and line_cursor >= until:
                break

            if inc_cursor < len(inc_rows):
                what, line, native, foreign = inc_rows[inc_cursor]
                foreign = bool(foreign)
                if line <= line_cursor:
                    inc_cursor += 1
                    if not foreign:
                        self._get_foreign_stuff(visited_set, export_set, what, -1, con)
                    elif not any(s == native for _, s in export_set):
                        export_set.append(('include', native))
                    continue

            if macro_cursor < len(macro_rows):
                ident, line, function_like, definition, params = macro_rows[macro_cursor]
                function_like = bool(function_like)
                if line <= line_cursor:
                    macro_cursor += 1
                    if not any(s == ident for _, s in export_set):
                        export_set.append(('macro', Unit.create_macro_definition_directive(ident, function_like, definition, params)))
                    continue

            line_cursor += 1
            continue

        return None

    def get_deps_late(self, e: Exporter) -> dict[Unit, list[str]]:
        """
        !!Only meaningful very late. After merging.!!
        """
        out = {}
        for elem in self.elements:
            refs = list(elem.get_flat_refs()) # Deterministic order.
            refs.sort()
            for ref in refs:
                x = e.find_unit_from_element(ref) # Only for backwards compatability.
                if x is None:
                    x = e.find_unit_from_element(Unit.remove_cv_ptr_arr(ref))
                    if x is None:
                        continue

                u, ref = x
                if not (u in out):
                    out[u] = []
                out[u].append(ref)
                continue
            continue
        return out

    def has_any_of(self, typename) -> bool:
        for e in self.elements:
            if isinstance(e, typename):
                return True
            if isinstance(e, UnitWrap):
                for wrapped in e.subs:
                    if isinstance(wrapped, typename):
                        return True
                    continue
            continue
        return False

    def get_num_of(self, typename) -> int:
        assert typename is not UnitWrap
        num = 0
        for e in self.elements:
            if isinstance(e, typename):
                num += 1
            elif isinstance(e, UnitWrap):
                for wrapped in e.subs:
                    if isinstance(wrapped, typename):
                        num += 1
                    continue
            continue
        return num


class Exporter:

    def __init__(self, g: Globals, display_name: str, directory: str, con: SqlConnection):
        self.g = g
        self.display_name = display_name
        self.directory = directory
        self.con = con

        self.stats: StatTrack = StatTrack()

        """The original source files detected."""
        self.source_files: list[SourceFile] = []

        """The actual units we export."""
        self.units: list[Unit] = []

        self.redirected_permanently: dict[str, str] = {}

        """SCCs that are builtin inside the project and without AST transformations are impossible to get rid of."""
        self.detected_builtin_sccs: list[list[str]] = []

    def get_source_file(self, ident: str) -> SourceFile | None:
        for sf in self.source_files:
            if sf.ident == ident:
                return sf
        return None

    def get_source_file_asserted(self, ident: str) -> SourceFile:
        sf = self.get_source_file(ident)
        assert sf is not None
        return sf

    def get_or_register_source_file(self, ident: str) -> SourceFile:
        sf = self.get_source_file(ident)
        if sf is None:
            sf = SourceFile(ident)
            self.source_files.append(sf)
        return sf

    def find_unit_from_element_flatten(self, ident: str) -> Unit | None:
        for u in self.units:
            assert len(u.elements) != 0
            out = u.get_element(ident)
            if out is not None:
                return u
            continue
        return None

    def find_unit_from_element(self, ident: str) -> tuple[
            Unit, str # Unit, redirect
        ] | None:
        u = self.find_unit_from_element_flatten(ident)
        if u is not None:
            return u, ident
        for k, v in self.redirected_permanently.items():
            if k == ident:
                return self.find_unit_from_element(v)
            continue
        return None

    def make_unit(self, e: UnitElement) -> Unit:
        u: Unit = Unit()
        u.elements.append(e)
        self.units.append(u)
        return u

    def report(self) -> None:
        print('Preparing report ...', flush=True)

        p: Path = self.get_report_file()
        with open(p, 'w') as f:
            exceeded_n: list[Unit] = [u for u in self.units if u.get_n_size(self.g) > self.g.args.N]

            self.con.execute_ro("""SELECT COUNT(*) FROM Decls;""")
            count_decls = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Functions;""")
            count_functions = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Macros;""")
            count_macros = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Records;""")
            count_records = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Refs;""")
            count_refs = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Translations;""")
            count_translations = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Typedefs;""")
            count_typedefs = self.con.fetchone()[0]

            self.con.execute_ro("""SELECT COUNT(*) FROM Variables;""")
            count_variables = self.con.fetchone()[0]

            exp = self.units
            exp.sort(key=lambda u: u.get_n_size(self.g), reverse=True)

            data = {
                'DisplayName': self.display_name,
                'Directory': self.directory,
                'ComplexityScore': count_decls + count_functions + count_macros + count_records +
                                   count_refs + count_translations + count_typedefs + count_variables,

                'RuntimeStats': {
                    'AnalysisTime': self.g.analysis_time,
                    'SplitTime': time.perf_counter() - self.g.time_cursor,
                },

                'RunParameters': {
                    'UsedN': self.g.args.N,
                    'CountDeclDocsToN': self.g.args.CountDeclDocsToN,
                    'CountDocsToN': self.g.args.CountDocsToN,
                },

                'SourceStats': {
                    'SourceFiles': len(self.source_files),
                    'SourceHeaders': len(self.source_files) - count_translations,
                    'SourceTranslations': count_translations,
                },

                'DiscoveredStats': {
                    'Decls': count_decls,
                    'Functions': count_functions,
                    'Macros': count_macros,
                    'Records': count_records,
                    'Refs': count_refs,
                    'Typedefs': count_typedefs,
                    'Variables': count_variables,
                },

                'ProcessedStats': {
                    'Functions': self.stats.original_function_count,
                    'Records': self.stats.original_record_count,
                    'Typedefs': self.stats.original_typedef_count,
                    'Variables': self.stats.original_variable_count,
                },

                'UnitStats': {
                    'MaxUnitCount': self.stats.max_unit_count,
                    'FinalUnitCount': len(self.units),
                    'HeaderCount': len([u for u in self.units if u.is_header(self.g)]),
                    'TranslationCount': len([u for u in self.units if u.is_translation(self.g)]),

                    'ExceededNCount': len(exceeded_n),
                    'AverageN': sum(u.get_n_size(self.g) for u in self.units) / len(self.units) if len(self.units) > 0 else 0,
                    'AverageExceededN': sum(u.get_n_size(self.g) for u in exceeded_n) / len(exceeded_n) if len(exceeded_n) > 0 else 0,

                    'AverageElemCount': sum(len(u.elements) for u in self.units) / len(self.units) if len(self.units) > 0 else 0,
                },

                'Units': [
                    {
                        'Name': u.get_human_readable_name(),
                        'Filename': u.get_filename(),
                        'ElementCount': len(u.elements),
                        'N': u.get_n_size(self.g),
                        'Deps': [
                            {
                                'Unit': k.get_filename(),
                                'Symbols': xs
                            }
                            for k, xs in u.get_deps_late(self).items()
                        ]
                    }
                    for u in exp
                ],

                'SymbolSCCs': self.detected_builtin_sccs,
            }
            f.write(json.dumps(data, indent=4))
            if self.g.args.Verbose:
                print(f'Decomposition-report exported to [{p.__str__()}].')

        return None

    def gather_unit_content(self) -> None:
        print(f'Gathering unit content for [{len(self.units)}] units ...', flush=True)
        cursor: int = 1
        for u in self.units:
            print(f'[{cursor:0{len(str(len(self.units)))}d}/{len(self.units)}] [{u.get_human_readable_name()}] ...', end=' ', flush=True)
            u.cache_content(self.g, self.con)
            print('done')
            cursor += 1
            continue
        print(f'Gathering unit content for [{len(self.units)}] units ... done')

        return None

    def gather_unit_refs(self) -> None:
        print(f'Gathering unit refs for [{len(self.units)}] units ...', end=' ', flush=True)
        for u in self.units:
            u.update_refs(self.g, self.con)
            continue
        print('done')
        return None

    def export_units(self) -> None:
        print('Assigning output filenames ...', end=' ', flush=True)
        cursor: int = 1
        for u in self.units:
            assert u.output_ident is None
            u.output_ident = f'Unit_{cursor:0{len(str(len(self.units)))}d}'
            u.master_ext = '.c' if u.is_translation(self.g) else '.h'
            cursor += 1
            continue
        print('done')

        print('Finalizing unit content ...', flush=True)
        cursor: int = 1
        for u in self.units:
            print(f'[{cursor:0{len(str(len(self.units)))}d}/{len(self.units)}] [{u.get_human_readable_name()}] ...', end=' ', flush=True)
            u.create_content(self.g, self, self.con)
            print('done')
            cursor += 1
            continue
        print('Finalizing unit content ... done')

        out_dir: Path = self.get_out_dir()
        if not out_dir.exists():
            print(f'Creating output directory [{out_dir.__str__()}] ...', end=' ', flush=True)
            out_dir.mkdir(parents=True)
            print('done')

        files_updated: int = 0
        print(f'Exporting {len(self.units)} units to [{out_dir.__str__()}] ...', flush=True)
        for u in self.units:
            if _write_if_different(self.g, out_dir / f'{u.output_ident}{u.master_ext}', u.content):
                files_updated += 1
            if _write_if_different(self.g, out_dir / u.get_ctx_filename(), u.ctx_content):
                files_updated += 1
            continue
        print(f'Exporting {len(self.units)} units to [{out_dir.__str__()}] ... done')

        print(f'Updated [{files_updated}] files.')

        return None

    def get_out_dir(self) -> Path:
        return Path(self.directory) / 'Out'

    def get_report_file(self) -> Path:
        return Path(self.directory) / 'Report.json'


def _write_if_different(g: Globals, file_path: Path, content: str) -> bool:
    if os.path.exists(file_path):
        if not g.args.OkIfExists:
            raise ValueError(f'File [{file_path}] already exists.')
        with open(file_path, 'r') as file:
            existing_content = file.read()
            if existing_content == content:
                return False

    with open(file_path, 'w') as file:
        file.write(content)
        print(f'Written [{file_path}].')
        return True
