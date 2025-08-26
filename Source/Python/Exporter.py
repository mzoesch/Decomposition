from __future__ import annotations
import json
import os
import time
from pathlib import Path
from Source.Python.Globals import Globals
from Source.Python.SqlConnection import SqlConnection
from Source.Python.StatTrack import StatTrack
from Source.Python.Locations import SourceFile
from Source.Python.Elements import UnitElement


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

    def get_human_readable_name(self) -> str:
        assert len(self.elements) > 0
        human_readable_name: str = ''
        for s in self.elements:
            if len(human_readable_name) > 0:
                human_readable_name += '; '
            human_readable_name += s.ident
        return human_readable_name

    def is_output_ident_valid(self) -> bool:
        return self.output_ident is not None and self.output_ident != ''

    def is_content_valid(self) -> bool:
        return self.content is not None

    def is_translation(self) -> bool:
        assert len(self.elements) > 0
        return self.elements[0].is_translation()

    def is_header(self) -> bool:
        return not self.is_translation()

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

        fwds: list[str] = []
        for e in self.elements:
            con.execute_ro("""
            SELECT Ref, Type FROM Refs
            WHERE Source = ? AND Line = ? AND "Column" = ?
            ;""", (e.source.file.ident, e.source.line, e.source.column))

            rows = con.fetchall()
            for r, ty in rows:
                if ty == 'record':
                    r = Unit.remove_quals_from_type(r)
                    if Unit.is_trivial_type(r):
                        continue

                    u: Unit = ex.find_unit_from_element(r)
                    if u is None:
                        continue
                    assert u.is_output_ident_valid()

                    if u is self:
                        r_ref = u.get_element_asserted(r)
                        fwds.append(r_ref.get_forward_declaration(g))
                        continue

                    if u.is_header():
                        self.ctx_content += f'#include "{u.get_filename()}"\n'
                    else:
                        r_ref = u.get_element_asserted(r)
                        fwds.append(r_ref.get_forward_declaration(g))

                elif ty == 'variable':
                    u: Unit = ex.find_unit_from_element(r)
                    if u is None: # Std, <builtin>, ...
                        continue

                    # It is ok if this references itself.
                    r_ref = u.get_element_asserted(r)
                    fwds.append(r_ref.get_forward_declaration(g))

                else:
                    assert False

                continue
            continue

        seen_macros: set[tuple[str, str]] = set()
        for f in unique_source_files:
            con.execute_ro("""
            SELECT Identifier, bFunctionLike, Definition, Params FROM SeenMacros
            WHERE Source = ?
            ;""", (f.ident,))

            rows = con.fetchall()
            for ident, function_like, definition, params in rows:
                seen_macros.add((ident, Unit.create_macro_definition_directive(ident, function_like, definition, params)))
                continue
            continue
        if len(seen_macros) > 0:
            self.ctx_content += '/* Seen */\n'
            seen_macros_list: list[str] = [m for _, m in seen_macros]
            seen_macros_list.sort()
            for m in seen_macros_list:
                self.ctx_content += m
                self.ctx_content += '\n'
                continue
            self.ctx_content += '\n'

        for ty, val in self.get_foreign_stuff(con):
            if ty == 'include':
                self.ctx_content += f'#include "{val}"\n'
            elif ty == 'macro':
                self.ctx_content += val
                self.ctx_content += '\n'
            else:
                assert False

        for fwd in fwds:
            if fwd is None:
                continue
            self.ctx_content += fwd
            self.ctx_content += '\n'
            continue

        self.content = Unit.create_guard(self.content, self.get_output_ident_guard())
        self.ctx_content = Unit.create_double_inclusion_error(self.ctx_content, self.get_output_ident_guard_ctx())

        return None

    def get_output_ident_guard(self) -> str:
        assert self.output_ident is not None
        return f'{self.output_ident.upper()}_{self.master_ext[1:].upper()}'

    def get_output_ident_guard_ctx(self) -> str:
        return f'{self.get_output_ident_guard()}_CTX'

    def merge(self, o: Unit) -> None:
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

        return None

    @staticmethod
    def create_guard(content: str, name: str) -> str:
        return f'#ifndef {name}\n#define {name}\n\n{content}\n#endif /* {name} */\n'

    @staticmethod
    def create_double_inclusion_error(content: str, name: str) -> str:
        return f'#ifdef {name}\n    #error {name} is already defined.\n#endif /* {name} */\n#define {name}\n\n{content}'

    def get_foreign_stuff(self, con: SqlConnection) -> list[tuple[str, str]]:
        out: list[tuple[str, str]] = []
        for e in self.elements:
            visited_set: list[str] = []
            self._get_foreign_stuff(visited_set, out, e.source.file.ident, e.source.line, con)
            continue
        return out

    @staticmethod
    def remove_quals_from_type(ty: str) -> str:
        ty = ty.strip()
        if ('[' in ty) and ty.endswith(']'):
            ty = ty[:ty.rfind('[')].strip()
        return ty

    @staticmethod
    def is_trivial_type(ty: str) -> bool:
        return ty in [
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

    @staticmethod
    def create_macro_definition_directive(ident: str, function_like: bool, definition: str, params: str) -> str:
        if function_like:
            return f'#define {ident}({params}){definition}'
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
                if line <= line_cursor:
                    inc_cursor += 1
                    if not foreign:
                        self._get_foreign_stuff(visited_set, export_set, what, -1, con)
                    elif not any(s == native for _, s in export_set):
                        export_set.append(('include', native))
                    continue

            if macro_cursor < len(macro_rows):
                ident, line, function_like, definition, params = macro_rows[macro_cursor]
                if line <= line_cursor:
                    macro_cursor += 1
                    if not any(s == ident for _, s in export_set):
                        export_set.append(('macro', Unit.create_macro_definition_directive(ident, function_like, definition, params)))
                    continue

            line_cursor += 1
            continue

        return None


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

    def find_unit_from_element(self, ident: str) -> Unit | None:
        for u in self.units:
            assert len(u.elements) != 0
            out = u.get_element(ident)
            if out is not None:
                return u
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
                    'FunctionDecls': count_decls,
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
                    'HeaderCount': len([u for u in self.units if u.is_header()]),
                    'TranslationCount': len([u for u in self.units if u.is_translation()]),

                    'ExceededNCount': len(exceeded_n),
                    'AverageN': sum(u.get_n_size(self.g) for u in self.units) / len(self.units) if len(self.units) > 0 else 0,
                    'AverageExceededN': sum(u.get_n_size(self.g) for u in exceeded_n) / len(exceeded_n) if len(exceeded_n) > 0 else 0,
                },
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

    def export_units(self) -> None:
        print('Assigning output filenames ...', end=' ', flush=True)
        cursor: int = 1
        for u in self.units:
            assert u.output_ident is None
            u.output_ident = f'Unit_{cursor:0{len(str(len(self.units)))}d}'
            u.master_ext = '.c' if u.is_translation() else '.h'
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
