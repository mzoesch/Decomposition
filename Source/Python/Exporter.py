import os
import sys
import json
from Source.Python.Types import *
from Source.Python.Cursor import Cursor


class SymbolReference:
    """
    Represents a reference to a symbol inside a file.
    """

    def __init__(self, identifier: str, hint: str | None = None):
        self.identifier = identifier
        self.hint = hint
        assert( self.identifier is not None and self.identifier != '' )
        return

    def __eq__(self, other):
        if isinstance(other, str):
            assert (other is not None and other != '' )
            return self.identifier == other
        elif isinstance(other, SymbolReference):
            assert( other.identifier is not None and other.identifier != '' )
            return self.identifier == other.identifier
        return False


class SourceCodeLocation:
    """
    Represents a location in the original source code.
    """

    def __init__(self, file: str, line: int, column: int):
        self.file = file
        self.line = line
        self.column = column
        return


class Symbol:
    """
    Represents a symbol to inside a file.
    """

    def __init__(
        self,
        symbol_type: ESymbolType,
        identifier: str,
        content: str,
        decldoc: str | None,
        source: SourceCodeLocation,
        references: list[SymbolReference] = None,
        native: dict | None = None
        ):
        self.symbol_type = symbol_type
        self.identifier = identifier
        self.content = content
        self.decldoc = decldoc
        self.source = source
        self.references = []
        if references is not None:
            for r in references:
                self.add_reference(r.identifier, r.hint)
                continue
        self.native: dict | None = native
        return

    def is_valid(self) -> bool:
        return self.identifier is not None and len(self.identifier) > 0

    def add_reference(self, reference: str, hint: str | None = None) -> None:
        if reference in self.references:
            return None

        # TODO: Make this more robust.

        stripped: str = reference.strip()
        # stripped = stripped.replace('const ', '') # <- this causes to many issues.
        # stripped = stripped.replace('volatile ', '')
        # stripped = stripped.replace('* ', '')
        # stripped: str = stripped.strip()

        if stripped.__contains__('[') and stripped[-1] == ']':
            stripped = stripped[:stripped.index('[')]

        if stripped in [
            'void',
            'bool',
            'char', 'unsigned char', 'signed char',
            'short', 'unsigned short', 'signed short',
            'int', 'unsigned', 'unsigned int', 'signed', 'signed int',
            'long', 'unsigned long', 'signed long',
            'float', 'double',
            'struct', 'enum',
            'size_t', 'ptrdiff_t', 'ssize_t', 'intptr_t', 'uintptr_t',
            'wchar_t', 'char16_t', 'char32_t',
        ]:
            return None

        self.references.append(SymbolReference(stripped, hint))

        return None

    def get_fwd(self, args) -> str:
        if self.symbol_type == ESymbolType.FUNCTION:
            if self.native is None:
                raise ValueError(f'No native access for symbol [{self.identifier}].')
            if args.RespectStatic and self.native['bStatic']:
                return f'static {self.native['Ret']} {self.identifier}({', '.join([f'{p['Type']} {p['Identifier']}' for p in self.native['Params']])});'
            else:
                return f'{self.native['Ret']} {self.identifier}({', '.join([f'{p['Type']} {p['Identifier']}' for p in self.native['Params']])});'
        else:
            raise ValueError(f'No forward for symbol type [{self.symbol_type}] on symbol [{self.identifier}].')

    def get_n_size(self, args) -> int:
        decldoc_n: int = 0
        if args.CountDeclDocsToN:
            decldoc_n = sum((not c.isspace()) for c in self.decldoc) if (self.decldoc is not None) else 0

        if args.CountDocsToN is False:
            out: int = 0
            cursor: Cursor = Cursor(args, self.content)
            for c, valid in cursor.iter():
                if c is None:
                    out -= 1
                    continue

                if valid is False:
                    continue

                if c.isspace() is False:
                    out += 1
                continue

            return max(out, 0) + decldoc_n

        return sum((not c.isspace()) for c in self.content) + decldoc_n


class Macro:
    """
    Represents an exported macro.
    """

    def __init__(self, identifier: str, definition: str):
        self.identifier = identifier
        self.definition = definition

        return

    def __eq__(self, other):
        if isinstance(other, str):
            return self.identifier == other
        elif isinstance(other, Macro):
            return self.identifier == other.identifier
        assert False
        return False


class Exporter:
    """
    Wrapper around the file-exporting process.
    """

    class File:
        """
        Represents a file to be exported.
        """

        def __init__(self, symbol: Symbol):
            self.symbols: list[Symbol] = [symbol]

            self.base_name: str | None = None
            self.main_extension: str | None = None

            """
            The actual content of the file that the LLM is going to transpile.
            """
            self.final_content: str | None = None

            """
            The context content of the file. This may be in a separate file if specified or 
            at the top of the #final_content depending on what the user specified.
            """
            self.ctx_content: str | None = None

            return

        def get_total_n_size(self, args) -> int:
            n: int = 0
            for s in self.symbols:
                n += s.get_n_size(args)
            return n

        def get_symbol(self, ref: str) -> Symbol | None:
            for s in self.symbols:
                if s.identifier == ref:
                    return s

            if ref.startswith('struct '):
                tail = ref[7:]
                for s in self.symbols:
                    if (not s.symbol_type == ESymbolType.RECORD) or (s.native is None):
                        continue
                    if s.identifier == tail and s.native['Type'] == 'struct':
                        return s
                    continue

            if ref.startswith('enum '):
                tail = ref[5:]
                for s in self.symbols:
                    if (not s.symbol_type == ESymbolType.RECORD) or (s.native is None):
                        continue
                    if s.identifier == tail and s.native['Type'] == 'enum':
                        return s
                    continue

            return None

        def get_symbol_checked(self, identifier: str) -> Symbol:
            s = self.get_symbol(identifier)
            if s is None:
                raise ValueError(f'Symbol [{identifier}] not found in file [{self.get_file_name()}].')
            return s

        def is_name_valid(self):
            return (self.base_name is not None) and (self.main_extension is not None)

        def get_file_name(self):
            assert( self.is_name_valid() )
            return f'{self.base_name}{self.main_extension}'

        def get_ctx_file_name(self):
            assert( self.is_name_valid() )
            assert( self.ctx_content is not None )
            return f'.{self.base_name}.ctx'

        def is_content_valid(self) -> bool:
            return self.final_content is not None

        def get_content(self) -> str:
            assert( self.is_content_valid() )
            return self.final_content

        def is_ctx_content_valid(self) -> bool:
            return self.ctx_content is not None

        def get_ctx_content(self) -> str:
            assert( self.is_ctx_content_valid() )
            return self.ctx_content

        def get_human_readable_name(self) -> str:
            human_readable_name: str = ''
            assert( len(self.symbols) > 0 )
            for s in self.symbols:
                if len(human_readable_name) > 0:
                    human_readable_name += '; '
                human_readable_name += s.identifier
            return human_readable_name

        def is_header(self) -> bool:
            if self.is_name_valid():
                return self.get_file_name().endswith('.h')
            assert( len(self.symbols) > 0 )
            for s in self.symbols:
                if s.symbol_type is ESymbolType.FUNCTION:
                    return False
                continue
            return True

        def is_translation(self) -> bool:
            return not self.is_header()

        def get_header_guard_name(self) -> str:
            return self.get_file_name().replace('.', '_').upper()

        def get_header_guard_begin(self) -> str:
            assert( self.is_header() )
            name: str = self.get_header_guard_name()
            return f'#ifndef {name}\n#define {name}\n'

        def get_header_guard_end(self) -> str:
            assert( self.is_header() )
            name: str = self.get_header_guard_name()
            return f'#endif /* {name} */\n'

        def get_header_guard_name_ctx(self) -> str:
            assert( self.is_ctx_content_valid() )
            return f'{self.get_header_guard_name()}_CTX'

        def get_header_guard_begin_ctx(self) -> str:
            assert( self.is_ctx_content_valid() )
            name: str = self.get_header_guard_name_ctx()
            return f'#ifdef {name}\n    #error {name} is already defined.\n#endif /* {name} */\n#define {name}\n'

        def get_header_guard_end_ctx(self) -> str:
            assert( self.is_ctx_content_valid() )
            return f''

    def _add_intermediate_file(self, file: File) -> None:
        assert( (file in self.intermediate_files) is False )
        self.intermediate_files.append(file)
        return None

    def _remove_intermediate_file(self, file: File) -> None:
        self.intermediate_files.remove(file)
        return None

    def _add_file(self, file: File) -> None:
        assert( (file in self.files) is False )
        self.files.append(file)
        return None

    @staticmethod
    def trivially_desugar_type(ref: str) -> str:
        while True:
            ref = ref.strip()

            if ref.endswith('*'):
                ref = ref[:-1].strip()
                continue



            break

        return ref.strip()

    def find_file_by_reference(self, caller: File, ref: str, sugared: bool = True) -> File | None:
        fs: list[Exporter.File] = []

        for f in self.files:
            for s in f.symbols:
                if ref == s.identifier:
                    if caller is not f:
                        fs.append(f)
                continue
            continue

        if ref.startswith('struct '):
            tail = ref[7:]
            for f in self.files:
                for s in f.symbols:
                    if (not s.symbol_type == ESymbolType.RECORD) or (s.native is None):
                        continue
                    if tail == s.identifier and s.native['Type'] == 'struct':
                        if caller is not f:
                            fs.append(f)
                    continue
                continue

        if ref.startswith('enum '):
            tail = ref[5:]
            for f in self.files:
                for s in f.symbols:
                    if (not s.symbol_type == ESymbolType.RECORD) or (s.native is None):
                        continue
                    if tail == s.identifier and s.native['Type'] == 'enum':
                        if caller is not f:
                            fs.append(f)
                    continue
                continue

        if len(fs) <= 0:
            if sugared:
                return None
            else:
                return self.find_file_by_reference(caller, Exporter.trivially_desugar_type(ref), False)
        if len(fs) == 1:
            return fs[0]

        most_outer_f: Exporter.File | None = None
        for f in fs:
            for _f in fs:
                if f == _f:
                    continue
                for s in f.symbols:
                    for _s in _f.symbols:
                        if s.identifier in _s.references:
                            most_outer_f = _f
                            break
                        continue
                    continue
                continue
            continue
        return most_outer_f

    def find_file_by_reference_checked(self, calling_f: File, reference: str) -> File:
        f = self.find_file_by_reference(calling_f, reference)
        if f is None:
            raise ValueError(f'File with reference [{reference}] not found.')
        return f

    class TargetWdMapEntry:
        """
        Represents a mapping between a target and its working directory.
        """

        def __init__(self, target: str, wd: str):
            self.target = target
            self.wd = wd
            return

    _analyzed_targets: list[str] = []
    _current_target: str | None = None
    _target_wd_map: list[TargetWdMapEntry] = []

    @staticmethod
    def append_analyzed_target(name: str) -> None:
        if name not in Exporter._analyzed_targets:
            Exporter._analyzed_targets.append(name)
        return None

    @staticmethod
    def set_current_target(name: str | None) -> None:
        if name is not None:
            assert( name in Exporter._analyzed_targets )
        Exporter._current_target = name
        return None

    @staticmethod
    def add_wd_mapping(target: str, wd: str) -> None:
        assert( target is not None and target != '' )
        assert( wd is not None and wd != '' )
        for entry in Exporter._target_wd_map:
            if entry.target == target:
                assert( entry.wd == wd )
                return None
            continue
        Exporter._target_wd_map.append(Exporter.TargetWdMapEntry(target, wd))
        return None

    @staticmethod
    def get_current_target_wd() -> str:
        assert( Exporter._current_target is not None )
        for entry in Exporter._target_wd_map:
            if entry.target == Exporter._current_target:
                return entry.wd
        raise ValueError(f'No working directory mapping found for target [{Exporter._current_target}].')

    def __init__(self, args):
        self.args = args
        self.symbols: list[Symbol] = []
        self.files: list[Exporter.File] = []
        self.intermediate_files: list[Exporter.File] = []

        out: str = self.get_out_dir()
        if not os.path.exists(out):
            os.makedirs(out)
        if not os.path.isdir(out):
            raise ValueError(f'No such directory [{out}].')

        if not os.path.exists(self.get_intermediate_file()):
            raise ValueError(f'No such file [{self.get_intermediate_file()}].')

        self.warnings: list[str] = []

        self._ns: list[int] = []
        self._exceeded_ns: list[int] = []

        return

    def add_warning(self, warning: str) -> None:
        if warning not in self.warnings:
            self.warnings.append(warning)
        return None

    def add_symbol(self, symbol: Symbol) -> None:
        assert( (symbol in self.symbols) is False )
        self.symbols.append(symbol)
        return None

    def export(self, ir) -> None:
        print('Creating maximal set of files ...')
        for s in self.symbols:
            assert( s.is_valid() )
            f: Exporter.File = Exporter.File(s)
            self._add_intermediate_file(f)
            continue

        original_file_length: int = len(self.intermediate_files)
        print(f'Merging related symbols from [{len(self.symbols)}] files ...', flush=True)
        _cached_length: int = len(self.intermediate_files)
        while len(self.intermediate_files) > 0:
            if self.intermediate_files[0].get_total_n_size(self.args) >= self.args.N:
                self._add_file(self.intermediate_files.pop(0))
                continue

            if len(self.intermediate_files) == 1:
                self._add_file(self.intermediate_files.pop(0))
                continue

            if _cached_length == len(self.intermediate_files):
                self._add_file(self.intermediate_files.pop(0))
                continue

            _cached_length = len(self.intermediate_files)

            f: Exporter.File = self.intermediate_files[0]
            f_n: int = f.get_total_n_size(self.args)

            for other_idx in range(1, len(self.intermediate_files)):
                other_f: Exporter.File = self.intermediate_files[other_idx]
                assert( len(other_f.symbols) > 0 )

                # Do not merge files from translation units with headers.
                if f.is_header() != other_f.is_header():
                    continue

                # For the beginning, only merge files from the same files.
                if f.symbols[0].source.file != other_f.symbols[0].source.file:
                    continue

                cursor: int = 0
                while cursor < len(other_f.symbols):
                    other_s = other_f.symbols[cursor]
                    other_n: int = other_s.get_n_size(self.args)

                    if not (other_s.symbol_type == ESymbolType.FUNCTION):
                        ...
                    else:
                        ...

                    if f_n >= self.args.N:
                        break

                    if f_n + other_n > self.args.N:
                        cursor += 1
                        continue

                    def _merge_symbol_at(what: Symbol, where: int) -> None:
                        nonlocal f_n

                        assert( not (what in f.symbols) )
                        assert( what in other_f.symbols )
                        f.symbols.insert(where, what)
                        other_f.symbols.remove(what)

                        f_n += other_n
                        print(f'Merged [{what.identifier}] with another unit.', flush=True)

                        return None

                    added: bool = False
                    for i, s in enumerate(f.symbols):
                        # Avoid dependency misalignment. Is this fixable with dependency resolution?
                        if s.source.line < other_s.source.line:
                            continue

                        if other_s.symbol_type == ESymbolType.FUNCTION:
                            _merge_symbol_at(other_s, i)
                            added = True
                            break

                        else:
                            ...
                        continue

                    if not added:
                        if other_s.symbol_type == ESymbolType.FUNCTION:
                            _merge_symbol_at(other_s, len(f.symbols))
                            added = True
                            break
                        else:
                            ...

                    if not added:
                        cursor += 1

                    continue

                if len(other_f.symbols) == 0:
                    self._remove_intermediate_file(other_f)
                    break

                if f_n >= self.args.N:
                    break

                continue

            continue
        print(f'Finished merging [{len(self.symbols)}] symbols from [{original_file_length}] files into [{len(self.files)}] files.')

        print(f'Assigning file names ...', end=' ', flush=True)
        cursor: int = 1
        for f in self.files:
            assert( f.is_name_valid() is False )
            if f.is_header():
                f.base_name = f'Unit_{cursor:0{len(str(len(self.files)))}d}'
                f.main_extension = f'.h'
            else:
                f.base_name = f'Unit_{cursor:0{len(str(len(self.files)))}d}'
                f.main_extension = f'.c'
            cursor += 1
            continue
        print('done')

        for f in self.files:
            f_n: int = f.get_total_n_size(self.args)
            self._ns.append(f_n)
            if f_n > self.args.N:
                self.add_warning(f'File [{f.get_file_name()}] exceeds the maximum size of [{self.args.N}] with [{f_n}].')
                self._exceeded_ns.append(f_n)
            continue

        print(f'Creating content for [{len(self.files)}] files ...')
        cursor: int = 1
        for f in self.files:
            print(f'[{cursor:0{len(str(len(self.files)))}d}/{len(self.files)}] [{f.get_human_readable_name()}] ...', end=' ', flush=True)

            f.final_content = ''
            f.ctx_content = ''

            for s in f.symbols:
                if len(f.final_content) > 0:
                    f.final_content += '\n'

                if self.args.PurgeDeclDocs is False:
                    if s.decldoc is not None:
                        f.final_content += f'{s.decldoc}\n'

                f.final_content += s.content
                f.final_content += '\n'

                continue

            foreign_includes: list[str] = []
            for s in f.symbols:
                for _f in ir['Files']:
                    if _f['Identifier'] != s.source.file:
                        continue
                    if _f.get('Includes') is None:
                        continue
                    for i in _f['Includes']:
                        if i['Line'] > s.source.line:
                            continue
                        if i['ModuleHeader']:
                            visited_set: list[str] = []
                            self._get_transitive_includes_non_module(visited_set, foreign_includes, i['Native'], ir)
                        else:
                            if i['Native'] not in foreign_includes:
                                foreign_includes.append(i['Native'])
                    continue
                continue
            for i in foreign_includes:
                f.ctx_content  += f'#include "{i}"\n'

            var_refs: list[str] = [] # Global / static variable references
            s_refs: list[str] = [] # Symbol references
            ff_refs: list[str] = [] # Foreign function references

            for s in f.symbols:
                if (s.native is not None) and (s.native.get('VarRefs') is not None):
                    for r in s.native['VarRefs']:
                        var_refs.append(f'extern {r["Type"]} {r["Identifier"]};')
                        s.add_reference(r['Type'])
                continue

            for s in f.symbols:
                def add_s_ref_type(_ref: str) -> None:
                    _ref_f: Exporter.File | None = self.find_file_by_reference(f, _ref)
                    if _ref_f is None:
                        self.add_warning(f'[PARAM] Could not find symbol reference [{_ref}].')
                        return None
                    if _ref_f is f:
                        return None
                    _ref_s: Symbol = _ref_f.get_symbol_checked(_ref)
                    if _ref_s.symbol_type != ESymbolType.FUNCTION:
                        _extern_spec = f'#include "{_ref_f.get_file_name()}"'
                        if _extern_spec not in s_refs:
                            s_refs.append(_extern_spec)
                    return None

                for r in s.references:
                    ref_f: Exporter.File | None = self.find_file_by_reference(f, r.identifier)
                    if ref_f is None:
                        found: bool = False
                        for _s in f.symbols:
                            if _s.identifier == r.identifier:
                                found = True
                                break
                            continue
                        if not found:
                            self.add_warning(f'[REFFD] Could not find symbol reference [{r.identifier}].')
                        continue
                    if ref_f is f:
                        continue
                    ref_s: Symbol = ref_f.get_symbol_checked(r.identifier)
                    if ref_s.symbol_type == ESymbolType.FUNCTION:
                        # add_s_ref_type(ref_s.native['Ret'])
                        # for p in ref_s.native['Params']:
                        #     add_s_ref_type(p['Type'])
                        #     continue
                        extern_spec: str = ref_s.get_fwd(self.args)
                        if extern_spec not in ff_refs:
                            ff_refs.append(extern_spec)
                    else:
                        extern_spec: str = f'#include "{ref_f.get_file_name()}"'
                        if extern_spec not in s_refs:
                            s_refs.append(extern_spec)
                    continue
                continue

            # Forward local translation unit functions as function may have inter-calls between them.
            for s in f.symbols:
                if s.symbol_type != ESymbolType.FUNCTION:
                    continue
                forward_spec: str = s.get_fwd(self.args)
                if forward_spec not in ff_refs:
                    ff_refs.append(forward_spec)
                continue

            for s_ref in s_refs:
                f.ctx_content += f'{s_ref}\n'
                continue
            for vr in var_refs:
                f.ctx_content += f'{vr}\n'
                continue
            for ff_ref in ff_refs:
                f.ctx_content += f'{ff_ref}\n'
                continue

            macros: list[Macro] = []
            inc_macros: list[Macro] = []  # Macros that are included from other files.
            for s in f.symbols:
                for _f in ir['Files']:
                    if _f['Identifier'] != s.source.file:
                        continue

                    # Seen macros. So every macro that was seen when this file was touched.
                    if _f.get('SeenMacros') is not None:
                        for macro in _f['SeenMacros']:
                            if not (macro['Identifier'] in macros):
                                macros.append(Macro(macro['Identifier'], self._create_macro_definition(macro)))
                            continue

                    # Directly defined macros. Usually we would only need this, but many repos are wrong and depend
                    # on macros defined in other files not directly included - e.g., by including them in a
                    # translation unit before the current one.
                    if _f.get('Macros') is not None:
                        for macro in _f['Macros']:
                            if not (macro['Identifier'] in inc_macros):
                                inc_macros.append(Macro(macro['Identifier'], self._create_macro_definition(macro)))
                            continue
                    if _f.get('Includes') is not None:
                        for include in _f['Includes']:
                            if include['Line'] > s.source.line:
                                break
                            if include['ModuleHeader']:
                                visited_set: list[str] = []
                                self._get_transitive_macros_non_module(visited_set, inc_macros, include['Native'], ir)
                            continue
                    break
                continue
            if len(macros) > 0:
                f.ctx_content += '\n/* Seen */\n'
                macros = sorted(macros, key=lambda _m: _m.identifier)
                for m in macros:
                    f.ctx_content += f'{m.definition}\n'
                    continue
            if len(inc_macros) > 0:
                f.ctx_content += '\n/* Defined */\n'
                inc_macros = sorted(inc_macros, key=lambda _m: _m.identifier)
                for m in inc_macros:
                    f.ctx_content += f'{m.definition}\n'
                    continue

            if self.args.GiveContext:
                f.final_content = f'{f.ctx_content}\n{f.final_content}'
                f.ctx_content = None
            else:
                f.final_content = f'#include "{f.get_ctx_file_name()}"\n\n{f.final_content}'
                f.ctx_content = f'{f.get_header_guard_begin_ctx()}\n{f.ctx_content}\n{f.get_header_guard_end_ctx()}'

            if f.is_header():
                f.final_content = f'{f.get_header_guard_begin()}\n{f.final_content}\n{f.get_header_guard_end()}'

            cursor += 1
            print('done')
            continue

        out_dir = self.get_out_dir()
        files_updated = 0

        print(f'Finishing up main files with a total of [{len(self.files)}] ...')
        for f in self.files:
            if self._write_if_different(f'{out_dir}/{f.get_file_name()}', f.get_content()):
                files_updated += 1
            if f.ctx_content is not None:
                if self._write_if_different(f'{out_dir}/{f.get_ctx_file_name()}', f.get_ctx_content()):
                    files_updated += 1

            continue

        if len(self.warnings) > 0:
            for w in self.warnings:
                print(f'WARNING: {w}')
                continue
            print(f'Export let to [{len(self.warnings)}] warnings.')

        record_len: int = 0
        typedef_len: int = 0
        func_len: int = 0

        if 'Records' in ir:
            record_len = len(ir['Records'])
        if 'Typedefs' in ir:
            typedef_len = len(ir['Typedefs'])
        if 'Functions' in ir:
            func_len = len(ir['Functions'])

        print(f'Updated {files_updated} files with a total of [{record_len}] records, '
              f'[{typedef_len}] typedefs and [{func_len}] functions.')
        return None

    def report(self) -> None:

        with open(self.get_report_file(), 'w') as f:
            report_data = {
                'Target': Exporter._current_target,
                'FilesCount': len(self.files),

                'Symbols': len(self.symbols),
                'Records': len([s for s in self.symbols if s.symbol_type == ESymbolType.RECORD]),
                'Functions': len([s for s in self.symbols if s.symbol_type == ESymbolType.FUNCTION]),

                'UsedN': self.args.N,
                'ExceededNsCount': len(self._exceeded_ns),
                'AverageN': sum(self._ns) / len(self._ns) if len(self._ns) > 0 else 0,
                'AverageExceededN': sum(self._exceeded_ns) / len(self._exceeded_ns) if len(self._exceeded_ns) > 0 else 0,

                'Warnings': self.warnings,
                'Ns': self._ns,
                'ExceededNs': self._exceeded_ns,
            }
            f.write(json.dumps(report_data, indent=4))
            print(f'Written report to [{self.get_report_file()}].')

        return None

    def _get_transitive_includes_non_module(self, visited_set: list[str], export_set: list[str], start, ir) -> None:
        for c_file in ir['Files']:
            if c_file['Identifier'].endswith(start) is False:
                continue
            if c_file.get('Includes') is None:
                return None

            if c_file['Identifier'] in visited_set:
                return None
            visited_set.append(c_file['Identifier'])

            for inc in c_file['Includes']:
                if inc['ModuleHeader']:
                    self._get_transitive_includes_non_module(visited_set, export_set, inc['Native'], ir)
                    continue
                if not (inc['Native'] in export_set):
                    export_set.append(inc['Native'])
                continue

            break
        return None

    def _get_transitive_macros_non_module(self, visited_set: list[str], export_set: list[Macro], start, ir) -> None:
        for c_file in ir['Files']:
            if c_file['Identifier'].endswith(start) is False:
                continue
            if c_file.get('Macros') is None:
                return None

            if c_file['Identifier'] in visited_set:
                return None
            visited_set.append(c_file['Identifier'])

            for macro in c_file['Macros']:
                if not (macro['Identifier'] in export_set):
                    export_set.append(Macro(macro['Identifier'], self._create_macro_definition(macro)))
                continue

            if c_file.get('Includes'):
                for inc in c_file['Includes']:
                    if inc['ModuleHeader']:
                        self._get_transitive_macros_non_module(visited_set, export_set, inc['Native'], ir)
                    continue

            break
        return None

    def _write_if_different(self, file_path: str, content: str) -> bool:
        if os.path.exists(file_path):
            if not self.args.OkIfExists:
                raise ValueError(f'File [{file_path}] already exists.')
            with open(file_path, 'r') as file:
                existing_content = file.read()
                if existing_content == content:
                    return False

        with open(file_path, 'w') as file:
            file.write(content)
            print(f'Written [{file_path}].')
            return True

    @staticmethod
    def _create_macro_definition(macro_ir) -> str:
        out: str = f'#define {macro_ir['Identifier']}'
        if macro_ir['bFunctionLike']:
            out += '('
            out += ','.join(macro_ir['Params'])
            out += ')'
        out += f'{macro_ir['Definition']}'

        return out

    @staticmethod
    def get_abs_target_build_dir(args) -> str:
        assert( Exporter._current_target is not None )
        old_wd = os.getcwd()
        try:
            os.chdir(Exporter.get_current_target_wd())
            return os.path.abspath(f'Saved/tar-{Exporter._current_target}')
        finally:
            os.chdir(old_wd)

    @staticmethod
    def get_out_dir_s(args) -> str:
        assert( Exporter._current_target is not None )
        return f'{Exporter.get_abs_target_build_dir(args)}/Out'

    @staticmethod
    def get_intermediate_file_s(args) -> str:
        return f'{Exporter.get_abs_target_build_dir(args)}/IR.json'

    @staticmethod
    def get_bin_dir_s(args) -> str:
        assert( Exporter._current_target is not None )
        if os.path.isabs(args.TargetBuildBinDir):
            return args.TargetBuildBinDir
        return f'{Exporter.get_abs_target_build_dir(args)}/{args.TargetBuildBinDir}'

    @staticmethod
    def get_report_file_s(args) -> str:
        return f'{Exporter.get_abs_target_build_dir(args)}/Report.json'

    def get_out_dir(self) -> str:
        return Exporter.get_out_dir_s(self.args)

    def get_intermediate_file(self) -> str:
        return Exporter.get_intermediate_file_s(self.args)

    def get_bin_dir(self) -> str:
        return Exporter.get_bin_dir_s(self.args)

    def get_report_file(self):
        return Exporter.get_report_file_s(self.args)

    @staticmethod
    def _path_to_valid_name(path: str) -> str:
        return path.replace('/', '_').replace('\\', '_').replace(':', '_').replace(' ', '_')
