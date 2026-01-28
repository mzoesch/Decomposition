import os
import typing
from pathlib import Path


def analyse_and_split_cmake_repo(dir: str, tar: str, cmake_args: list[str], additional_args: str) -> tuple[bool, str]:
    if not os.path.exists(f'{dir}/CMakeLists.txt'):
        return False, f'No such file [{dir}/CMakeLists.txt].'

    cmd = f'python ./Launch.py -Verbose -CMakeLocation {dir} -CMakeTarget {tar} -OkIfExists -Report -DoAnalyse -DoSplit{additional_args}'
    if len(cmake_args) > 0:
        cmd += ' -CMakeArgs "' + ' '.join(cmake_args) + '"'

    print(f'Executing: [{cmd}].')

    cwd = os.getcwd()
    try:
        os.chdir(Path(__file__).parent.parent)
        os.system(cmd)
    finally:
        os.chdir(cwd)

    return True, ''


class Repository:
    def __init__(self
        , skip_prepare = False
        , skip_analyse = False
        , skip_decomposition = False
        , on_analyse_and_decompose = None
        , additional_args: str = ''
        ):
        self.skip_prepare = skip_prepare
        self.skip_analyse = skip_analyse
        self.skip_decomposition = skip_decomposition
        self.on_analyse_and_decompose = on_analyse_and_decompose
        self.additional_args = additional_args
        return

    def prepare(self) -> None:
        pass

    def analyse_and_split(self) -> None:
        if self.on_analyse_and_decompose is not None and callable(self.on_analyse_and_decompose):
            self.on_analyse_and_decompose(self)
        return None


class RemoteRepository(Repository):
    def __init__(self
        , url: str
        , name: str | None = None
        , branch: str | None = None
        , skip_prepare = False
        , skip_analyse = False
        , skip_decomposition = False
        , on_analyse_and_decompose = None
        , additional_args: str = ''
        ):
        super().__init__(skip_prepare=skip_prepare, skip_analyse=skip_analyse
            , skip_decomposition=skip_decomposition, on_analyse_and_decompose=on_analyse_and_decompose
            , additional_args=additional_args
            )
        self.url = url
        if name is None:
            self.name = self.url.split('/')[-1].replace('.git', '')
        else:
            self.name = name
        assert self.name is not None and isinstance(self.name, str) and len(self.name) > 0
        self.branch = branch

        return

    def get_abs_path(self) -> Path:
        return Path(self.name).absolute()

    @typing.override
    def prepare(self) -> None:
        super().prepare()

        p = self.get_abs_path()
        if p.exists():
            print(f'Repository [{p}] is already prepared, skipping clone.')
            return None

        print(f'Cloning repository [{self.name}] from [{self.url}] ...')
        cmd = f'git clone {self.url} {self.name} --depth=1'
        print(f'Executing: [{cmd}].')
        os.system(cmd)

        if self.branch is not None:
            print(f'Checking out branch [{self.branch}] ...')
            cwd = os.getcwd()
            try:
                os.chdir(p)
                cmds = [
                    "git remote set-branches origin '*'",
                    "git fetch -v --depth=1",
                    f"git switch origin/{self.branch} --detach",
                ]
                for cmd in cmds:
                    print(f'Executing [{cmd}].')
                    os.system(cmd)
                    continue
            finally:
                os.chdir(cwd)

        return None


class CMakeRepository(RemoteRepository):
    def __init__(self
        , url: str
        , target: str
        , cmake_args: list[str] | None = None
        , name: str | None = None
        , branch: str | None = None
        , additional_args: str = ''
        , on_analyse_and_decompose = None
        ):
        super().__init__(url=url, name=name, branch=branch
            , on_analyse_and_decompose=on_analyse_and_decompose, additional_args=additional_args
            )
        self.target = target
        self.cmake_args = cmake_args

        return

    @typing.override
    def analyse_and_split(self) -> None:
        super().analyse_and_split()
        try:
            rc, reason = analyse_and_split_cmake_repo(
                  str(self.get_abs_path())
                , self.target
                , [] if self.cmake_args is None else self.cmake_args
                , self.additional_args
                )
            if not rc:
                print(f'ERROR: {reason}')
        except Exception as e:
            print(f'ERROR: {str(e)}')
        return None


class HeaderOnlyRepository(CMakeRepository):
    def __init__(self
        , url: str
        , header: str
        , macro_impl_decl: str = ''
        , cmake_args: list[str] | None = None
        , name: str | None = None
        , branch: str | None = None
        , additional_args: str = ''
        , subdir: str = ''
        ):
        super().__init__(url, 'MyLibrary', cmake_args, name, branch, f' -ImplInHeader{additional_args}', self.analyse_hook)
        self.header = header
        self.macro_impl_decl = macro_impl_decl
        self.subdir = subdir
        return

    @typing.override
    def get_abs_path(self) -> Path:
        return super().get_abs_path() / self.subdir

    def analyse_hook(self, _) -> None:
        p = self.get_abs_path()
        print(f'Preparing single header repository [{p}] ...')

        if not p.exists():
            raise ValueError(f'No such directory [{p}].')

        f_impl = p/'Impl.c'
        f_cmake = p/'CMakeLists.txt'

        if not f_impl.exists():
            with open(f_impl, 'w', encoding='utf-8') as f:
                if len(self.macro_impl_decl) > 0:
                    f.write(f'{self.macro_impl_decl}\n')
                f.write(f'#include "{self.header}"\n')

        if not f_cmake.exists():
            f_template = Path(__file__).parent / '.HeaderOnlyTemplate.cmake'
            if not f_template.exists():
                raise FileNotFoundError(f'Template file [{str(f_template)}] not found.')
            with open(f_template, 'r', encoding='utf-8') as f:
                content = f.read()
            content = content.replace('@HEADER_FILE@', self.header)
            with open(f_cmake, 'w', encoding='utf-8') as f:
                f.write(content)

        return None


class GeneratedCMakeRepository(CMakeRepository):
    def __init__(self
         , url
         , sources: list[str]
         , cmake_args: list[str] | None = None
         , name: str | None = None
         , branch: str | None = None
         , additional_args: str = ''
         , pub_include_dirs: list[str] = None
         ):
        if pub_include_dirs is None:
            pub_include_dirs = []
        super().__init__(url=url, target='MyLibrary', cmake_args=cmake_args, name=name, branch=branch,
            additional_args=additional_args, on_analyse_and_decompose=self.analyse_hook
            )
        assert (sources is not None) and (len(sources) > 0)
        self.sources = sources
        self.pub_include_dirs = pub_include_dirs

    def analyse_hook(self, _) -> None:
        p = self.get_abs_path()
        print(f'Preparing CMakeLists.txt file for repository [{p}] ...')

        if not p.exists():
            raise ValueError(f'No such directory [{p}].')

        f_cmake = p/'CMakeLists.txt'
        if not f_cmake.exists():
            f_template = Path(__file__).parent / '.GeneratedCMakeRepository.cmake'
            if not f_template.exists():
                raise FileNotFoundError(f'Template file [{str(f_template)}] not found.')
            with open(f_template, 'r', encoding='utf-8') as f:
                content = f.read()
            content = content.replace('@SOURCES@', ' '.join(self.sources))
            content = content.replace('@PUB_INCLUDES@', ' '.join(self.pub_include_dirs))
            with open(f_cmake, 'w', encoding='utf-8') as f:
                f.write(content)

        return None


def common_repos_eval(repos: list[Repository]) -> None:
    print('#### Preparing repositories ...')
    for r in repos:
        r.prepare()

    print('#### Analysing and decomposing repositories ...')
    for r in repos:
        r.analyse_and_split()

    return None
