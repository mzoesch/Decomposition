import os
from Source.Python.Types import *


class SymbolReference:
    """
    Represents a reference to a symbol inside a file.
    """

    def __init__(self, identifier: str):
        self.identifier = identifier
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
        source: SourceCodeLocation,
        references: list[SymbolReference] = None,
        native: dict | None = None
        ):
        self.symbol_type = symbol_type
        self.identifier = identifier
        self.content = content
        self.source = source
        if references is None:
            self.references = []
        else:
            self.references = references.copy()
        self.native: dict | None = native
        return

    def add_reference(self, reference: str) -> None:
        if reference in self.references:
            return None

        if reference in [
            'void',
            'bool',
            'char', 'unsigned char', 'signed char',
            'short', 'unsigned short', 'signed short',
            'int', 'unsigned', 'unsigned int', 'signed', 'signed int',
            'long', 'unsigned long', 'signed long',
            'float', 'double',
            'struct', 'enum'
        ]:
            return None

        self.references.append(SymbolReference(reference))

        return None

    def get_fwd(self) -> str:
        if self.symbol_type == ESymbolType.FUNCTION:
            if self.native is None:
                raise ValueError(f'No native access for symbol [{self.identifier}].')
            return f'{self.native['Ret']} {self.identifier}({', '.join([f'{p['Type']} {p['Identifier']}' for p in self.native['Params']])});'
        else:
            raise ValueError(f'No forward for symbol type [{self.symbol_type}] on symbol [{self.identifier}].')


class Macro:
    """
    Represents an exported macro.
    """

    def __init__(self, identifier: str, definition: str):
        self.identifier = identifier
        self.definition = definition


class Exporter:
    """
    Wrapper around the file-exporting process.
    """

    class File:
        """
        Represents a file to be exported.
        """

        def __init__(self, symbol: Symbol):
            self.symbol = symbol

            assert(self.symbol.identifier is not None and self.symbol.identifier != '')
            if self.symbol.symbol_type == ESymbolType.RECORD:
                self.path = f'{self.symbol.identifier}.h'
            elif self.symbol.symbol_type == ESymbolType.FUNCTION:
                self.path = f'{self.symbol.identifier}.c'
            else:
                raise ValueError(f'Unknown symbol type [{self.symbol.symbol_type}] for symbol [{self.symbol.identifier}].')

            self.fwd_path = f'{self.path[:self.path.rfind('.')]}.fwd'
            self.inc_path = f'{self.path[:self.path.rfind('.')]}.inc'

            self.content = ''
            self.content += f'#include "{self.inc_path}"\n\n'
            self.content += symbol.content

            self.fwd_content = ''
            self.inc_content = ''

            return

        def __contains__(self, item) -> bool:
            if isinstance(item, str):
                return item in self.symbol.references
            elif isinstance(item, list):
                return any(i in self.symbol.references for i in item)
            raise TypeError(f'Expected str or list, got {type(item)}')

        def __eq__(self, other) -> bool:
            if isinstance(other, str):
                return self.path == other
            elif isinstance(other, Exporter.File):
                return self.path == other.path
            return False

        def get_extern_spec(self) -> str:
            if self.path.endswith('.c'):
                return self.symbol.get_fwd()
            else:
                return f'#include "{self.path}"'

        def prepend_content(self, in_content: str) -> None:
            self.content = f'{in_content}\n{self.content}'
            return None

        def append_content(self, in_content: str) -> None:
            self.content = f'{self.content}\n{in_content}'
            return None

        def prepend_fwd_content(self, in_content: str) -> None:
            self.fwd_content = f'{in_content}\n{self.fwd_content}'
            return None

        def append_fwd_content(self, in_content: str) -> None:
            self.fwd_content = f'{self.fwd_content}\n{in_content}'
            return None

        def prepend_inc_content(self, in_content: str) -> None:
            self.inc_content = f'{in_content}\n{self.inc_content}'
            return None

        def append_inc_content(self, in_content: str) -> None:
            self.inc_content = f'{self.inc_content}\n{in_content}'
            return None

    def _add_file(self, file: File) -> None:
        if file in self.files:
            raise ValueError(f'File [{file.path}] already exists.')
        self.files.append(file)
        return None

    def find_file_by_reference(self, reference: str) -> File | None:
        for f in self.files:
            if reference == f.symbol.identifier:
                return f

        if reference.startswith('struct '):
            tail = reference[7:]
            for f in self.files:
                if not f.symbol.symbol_type == ESymbolType.RECORD or f.symbol.native is None:
                    continue
                if tail == f.symbol.identifier and f.symbol.native['Type'] == 'struct':
                    return f
        return None

    def find_file_by_reference_checked(self, reference: str) -> File:
        f = self.find_file_by_reference(reference)
        if f is None:
            raise ValueError(f'File with reference [{reference}] not found.')
        return f

    def __init__(self, args):
        self.args = args
        self.symbols: list[Symbol] = []
        self.files: list[Exporter.File] = []

        out: str = self.get_out_dir()
        if os.path.exists(out) is False:
            os.makedirs(out)
        if os.path.isdir(out) is False:
            raise ValueError(f'No such directory [{out}].')

        if not os.path.exists(self.get_intermediate_file()):
            raise ValueError(f'No such file [{self.get_intermediate_file()}].')

        return

    def add_symbol(self, symbol: Symbol) -> None:
        self.symbols.append(symbol)
        return None

    def export(self, ir) -> None:
        for s in self.symbols:
            f: Exporter.File = Exporter.File(s)
            self._add_file(f)
            continue

        for f in self.files:
            f.content = f'\n{f.content}\n'
            if (f.symbol.native is not None) and (f.symbol.native.get('VarRefs') is not None):
                for r in f.symbol.native['VarRefs']:
                    f.prepend_content(f'extern {r['Type']} {r['Identifier']};')
            for r in f.symbol.references:
                ref_f: Exporter.File | None = self.find_file_by_reference(r.identifier)
                if ref_f is None:
                    continue
                f.prepend_content(f'{ref_f.get_extern_spec()}')
                continue

            includes: list[str] = []
            for c_file in ir['Files']:
                if c_file['Identifier'] != f.symbol.source.file:
                    continue
                if c_file.get('Includes') is None:
                    break
                for include in c_file['Includes']:
                    if include['Line'] > f.symbol.source.line:
                        break
                    if include['ModuleHeader']:
                        self._get_transitive_includes_non_module(includes, include['Native'], ir)
                    else:
                        if (include['Native'] in includes) is False:
                            includes.append(include['Native'])
                    continue
                break
            for i in includes:
                f.prepend_fwd_content(f'#include "{i}"')

            macros: list[Macro] = []
            for c_file in ir['Files']:
                if c_file['Identifier'] != f.symbol.source.file:
                    continue
                if c_file.get('Includes') is not None:
                    for include in c_file['Includes']:
                        if include['Line'] > f.symbol.source.line:
                            break
                        if include['ModuleHeader']:
                            self._get_transitive_macros_non_module(macros, include['Native'], ir)
                        continue
                if c_file.get('Macros') is not None:
                    for macro in c_file['Macros']:
                        if (macro['Identifier'] in macros) is False:
                            macros.append(Macro(macro['Identifier'], self._create_macro_definition(macro)))
                        continue
                break
            for m in macros:
                f.append_inc_content(m.definition)

            continue

        out = self.get_out_dir()
        files_updated = 0

        for f in self.files:
            f.prepend_content(f'#include "{f.fwd_path}"\n')
            if f.path.endswith('.c') is False:
                f.prepend_content('#pragma once\n')

            file_path: str = f'{out}/{f.path}'
            if os.path.exists(file_path):
                if not self.args.OkIfExists:
                    raise ValueError(f'File [{file_path}] already exists.')
                with open(file_path, 'r') as file:
                    content = file.read()
                    if content == f.content:
                        continue

            with open(file_path, 'w') as file:
                file.write(f.content)
                files_updated += 1
                print(f'Written [{file_path}].')
            continue

        for f in self.files:
            f.prepend_fwd_content('#pragma once\n')
            f.append_fwd_content('')

            fwd_file_path: str = f'{out}/{f.fwd_path}'
            if os.path.exists(fwd_file_path):
                if not self.args.OkIfExists:
                    raise ValueError(f'File [{fwd_file_path}] already exists.')
                with open(fwd_file_path, 'r') as file:
                    fwd_content = file.read()
                    if fwd_content == f.fwd_content:
                        continue

            with open(fwd_file_path, 'w') as file:
                file.write(f.fwd_content)
                files_updated += 1
                print(f'Written [{fwd_file_path}].')
            continue

        for f in self.files:
            f.prepend_inc_content('#pragma once')
            f.append_inc_content('')

            inc_file_path: str = f'{out}/{f.inc_path}'
            if os.path.exists(inc_file_path):
                if not self.args.OkIfExists:
                    raise ValueError(f'File [{inc_file_path}] already exists.')
                with open(inc_file_path, 'r') as file:
                    inc_content = file.read()
                    if inc_content == f.inc_content:
                        continue

            with open(inc_file_path, 'w') as file:
                file.write(f.inc_content)
                files_updated += 1
                print(f'Written [{inc_file_path}].')
            continue

        print(f'Updated {files_updated} files with a total of [{len(ir["Records"])}] records, '
              f'[{len(ir["Typedefs"])}] typedefs and [{len(ir["Functions"])}] functions.')
        return None

    def _get_transitive_includes_non_module(self, export_set: list[str], start, ir) -> None:
        for c_file in ir['Files']:
            if c_file['Identifier'].endswith(start) is False:
                continue
            if c_file.get('Includes') is None:
                return None

            for inc in c_file['Includes']:
                if inc['ModuleHeader']:
                    self._get_transitive_includes_non_module(export_set, inc['Native'], ir)
                    continue
                if (inc['Native'] in export_set) is False:
                    export_set.append(inc['Native'])
                continue
            break
        return None

    def _get_transitive_macros_non_module(self, export_set: list[Macro], start, ir) -> None:
        for c_file in ir['Files']:
            if c_file['Identifier'].endswith(start) is False:
                continue
            if c_file.get('Macros') is None:
                return None

            if c_file.get('Includes'):
                for inc in c_file['Includes']:
                    if inc['ModuleHeader']:
                        self._get_transitive_macros_non_module(export_set, inc['Native'], ir)
                    continue

            for macro in c_file['Macros']:
                if (macro['Identifier'] in export_set) is False:
                    export_set.append(Macro(macro['Identifier'], self._create_macro_definition(macro)))
                continue
            break
        return None

    def _create_macro_definition(self, macro_ir) -> str:
        out: str = f'#define {macro_ir['Identifier']}'
        if macro_ir['bFunctionLike']:
            out += '('
            out += ','.join(macro_ir['Params'])
            out += ')'
        out += f'{macro_ir['Definition']}'

        return out

    @staticmethod
    def get_out_dir_s(args) -> str:
        return f'{args.TargetBuildDir}/Saved/Out'

    @staticmethod
    def get_intermediate_file_s(args) -> str:
        return f'{args.TargetBuildDir}/Saved/IR.json'

    def get_out_dir(self) -> str:
        return Exporter.get_out_dir_s(self.args)

    def get_intermediate_file(self) -> str:
        return Exporter.get_intermediate_file_s(self.args)

    @staticmethod
    def _path_to_valid_name(path: str) -> str:
        return path.replace('/', '_').replace('\\', '_').replace(':', '_').replace(' ', '_')
