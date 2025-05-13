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


class Exporter:
    """
    Wrapper around the file exporting process.
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

            if self.path.endswith('.c'):
                self.content = ''
            else:
                self.content = '#pragma once\n\n'
            self.content += symbol.content

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
            for r in f.symbol.references:
                ref_f: Exporter.File | None = self.find_file_by_reference(r.identifier)
                if ref_f is None:
                    continue
                f.content = f'{ref_f.get_extern_spec()}\n{f.content}'
                continue

            includes: set[str] = set()
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
                            includes.add(include['Native'])
                    continue
                break
            for i in includes:
                f.content = f'#include "{i}"\n{f.content}'

            continue

        out = self.get_out_dir()
        files_updated = 0

        for f in self.files:
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

        print(f'Updated {files_updated} files with a total of [{len(ir["Records"])}] records, '
              f'[{len(ir["Typedefs"])}] typedefs and [{len(ir["Functions"])}] functions.')
        return None

    def _get_transitive_includes_non_module(self, export_set: set[str], start, ir) -> None:
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
                    export_set.add(inc['Native'])
                continue
            break
        return None

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
