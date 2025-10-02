import os
import sys
import argparse
import requests
import json
from pathlib import Path


class CMakeRepository:
    def __init__(self, url: str, target: str, cmake_args: list[str] | None = None, name: str | None = None, on_analyse_and_split = None, branch: str | None = None) -> None:
        assert url is not None and isinstance(url, str) and len(url) > 0

        self._skip = False

        self.url = url
        self.target = target
        self.cmake_args = cmake_args

        if name is None:
            self.name = self.url.split('/')[-1].replace('.git', '')
        else:
            self.name = name

        assert self.name is not None and isinstance(self.name, str) and len(self.name) > 0

        self.on_analyse_and_split = on_analyse_and_split

        self.branch = branch

        return

    def is_on_analyze_valid(self) -> bool:
        return self.on_analyse_and_split is not None and callable(self.on_analyse_and_split)

    def get_absolute_path(self) -> Path:
        p: Path = Path(self.name)
        p = p.absolute()
        return p

    def clone(self) -> None:
        p: Path = Path(self.name)
        if p.exists() and p.is_dir():
            print(f'Repository [{self.name}] already exists, skipping clone.')
            return

        print(f'Cloning repository [{self.name}] from [{self.url}] ...')
        cmd = f'git clone {self.url} {self.name} --depth=1'
        print(cmd)
        os.system(cmd)

        if self.branch is not None:
            print(f'Checking out branch [{self.branch}] ...')
            cwd = os.getcwd()
            try:
                os.chdir(self.get_absolute_path())

                cmds = [
                    "git remote set-branches origin '*'",
                    "git fetch -v --depth=1",
                    f"git switch origin/{self.branch} --detach",
                    ]

                for cmd in cmds:
                    print(cmd)
                    os.system(cmd)
                    continue

            finally:
                os.chdir(cwd)

        return

    def analyse_and_split(self) -> tuple[bool, str] | bool:
        if self.is_on_analyze_valid():
            self.on_analyse_and_split(self)

        try:
            print(f'#### Analysing and splitting repository [{self.name}] ...')
            return CMakeRepository.analyse_and_split_cmake(
                str(self.get_absolute_path()),
                self.target,
                self.cmake_args,
                self.get_additional_args()
                )

        except Exception as e:
            return False, f'Exception occurred while analysing and splitting repository [{str(e)}].'

    def get_additional_args(self) -> str:
        return ''

    @staticmethod
    def analyse_and_split_cmake(directory: str, target: str, cmake_args: list[str] | None, additional_args: str) -> tuple[bool, str] | bool:
        if not os.path.exists(f'{directory}/CMakeLists.txt'):
            return False, 'Repository does not contain a CMakeLists.txt file, skipping.'

        cmd = f'python ./Launch.py -Verbose -CMakeLocation {directory} -CMakeTarget {target} -OkIfExists -Report -DoAnalyse -DoSplit{additional_args}'
        if cmake_args is not None and len(cmake_args) > 0:
            cmd += ' -CMakeArgs "' + ' '.join(cmake_args) + '"'
        print(cmd)

        cwd = os.getcwd()
        try:
            os.chdir(Path(__file__).parent.parent)
            os.system(cmd)

        finally:
            os.chdir(cwd)

        return True


class SingleHeaderCMakeRepository(CMakeRepository):
    def __init__(self, url: str, header: str , macro_impl_decl: str | None = None, subdir: str | None = None, name: str | None = None):
        assert header is not None and isinstance(header, str) and len(header) > 0

        super().__init__(
            url,
            target='MyLibrary',
            cmake_args=None,
            name=name,
            on_analyse_and_split=self.analyse_hook
            )

        self.header = header
        self.macro_impl_decl = macro_impl_decl
        self.subdir = subdir

        return

    def get_absolute_path(self) -> Path:
        if self.subdir is None:
            return super().get_absolute_path()
        p: Path = Path(self.name)
        p = p.absolute()
        p = p / self.subdir

        return p

    def get_additional_args(self) -> str:
        return ' -ImplInHeader'

    def analyse_hook(self, _: CMakeRepository) -> None:
        print(f'Preparing single header repository [{self.name}] ...')
        # self.analyse_hook_pre(_)

        p: Path = Path(f'{self.name}')
        p = p.absolute()
        if self.subdir is not None:
            p = p / self.subdir
            assert p.exists() and p.is_dir(), f'Subdirectory [{self.subdir}] does not exist in repository [{self.name}].'

        p_translation = p / 'Translation.c'
        p_cmake = p / 'CMakeLists.txt'

        if not p_translation.exists():
            with open(p_translation, 'w', encoding='utf-8') as f:
                if self.macro_impl_decl is not None:
                    f.write(f'{self.macro_impl_decl}\n')
                f.write(f'#include "{self.header}"\n')

        if not p_cmake.exists():
            p_template = Path(__file__).parent / '.Template.cmake'
            if not p_template.exists():
                raise FileNotFoundError(f'Template file [{str(p_template)}] not found.')
            with open(p_template, 'r', encoding='utf-8') as f:
                content = f.read()
            content = content.replace('@HEADER_FILE@', self.header)
            with open(p_cmake, 'w', encoding='utf-8') as f:
                f.write(content)

        return None


class SingleHeaderReCMakeRepository(SingleHeaderCMakeRepository):
    def __init__(self, url: str, header: str , macro_impl_decl: str | None = None, subdir: str | None = None, name: str | None = None):
        super().__init__(url, header, macro_impl_decl, subdir, name)
        return

    def analyse_hook(self, _: CMakeRepository) -> None:
        p: Path = Path(f'{self.name}')
        p = p.absolute()
        if self.subdir is not None:
            p = p / self.subdir
            assert p.exists() and p.is_dir(), f'Subdirectory [{self.subdir}] does not exist in repository [{self.name}].'

        p_cmake = p / 'CMakeLists.txt'
        p_cmake.unlink(True)

        return super().analyse_hook(_)


class GladKhrPlatformRepository(SingleHeaderCMakeRepository):
    def __init__(self):
        super().__init__(
            url='invalid',
            header='glad.h',
            macro_impl_decl=None,
            subdir=None,
            name='GladKhrPlatform',
            )
        return

    def clone(self) -> None:
        p = self.get_absolute_path()

        if not p.exists():
            p.mkdir()

        khr_platform_url = 'https://raw.githubusercontent.com/mzoesch/S-Jafg/refs/heads/trunk/Engine/Vendor/Include/KHR/khrplatform.h'
        glad_url = 'https://raw.githubusercontent.com/mzoesch/S-Jafg/refs/heads/trunk/Engine/Vendor/Include/glad/glad.h'

        r = requests.get(khr_platform_url)
        if r.status_code != 200:
            raise Exception(f'Failed to download khrplatform.h from [{khr_platform_url}].')
        with open(self.get_absolute_path() / 'khrplatform.h', 'w', encoding='utf-8') as f:
            f.write(r.text)

        r = requests.get(glad_url)
        if r.status_code != 200:
            raise Exception(f'Failed to download glad.h from [{glad_url}].')
        with open(self.get_absolute_path() / 'glad.h', 'w', encoding='utf-8') as f:
            f.write(r.text)

        return None


class ConfMakeRepository(CMakeRepository):
    def __init__(self, url: str, target: str, configure: str = 'configure', dry_run: bool = False, always_intercept_autoconf: bool = True) -> None:
        super().__init__(
            url,
            target=target,
            cmake_args=None,
            name=None,
            on_analyse_and_split=None
            )

        self.configure = configure
        self.dry_run = dry_run
        self.always_intercept_autoconf = always_intercept_autoconf

    def analyse_and_split(self) -> tuple[bool, str] | bool:
        if self.is_on_analyze_valid():
            self.on_analyse_and_split(self)

        try:
            print(f'#### Analysing and splitting repository [{self.name}] ...')
            intercepter = None
            if self.has_intercepter():
                intercepter = str(self.get_intercepter())
                print(f'Using intercepter [{intercepter}] ...')
            return ConfMakeRepository.analyse_and_split_confmake(
                str(self.get_absolute_path()),
                self.target,
                self.configure,
                self.dry_run,
                intercepter,
                self.always_intercept_autoconf
                )
        except Exception as e:
            return False, f'Exception occurred while analysing and splitting repository [{str(e)}].'

    def get_intercepter(self) -> Path:
        return Path(__file__).parent / f'Intercepter_{self.target}.py'

    def has_intercepter(self) -> bool:
        intercepter = self.get_intercepter()
        return intercepter.exists() and intercepter.is_file()

    @staticmethod
    def analyse_and_split_confmake(
            directory: str,
            target: str,
            configure: str = 'configure',
            dry_run: bool = False,
            intercepter: str | None = None,
            always_intercept_autoconf: bool = True
        ) -> tuple[bool, str] | bool:
        clang_plugin = 'Binaries/Clang/libDecomposition.so'
        autoconf_intercepter = 'Examples/AutoconfIntercepter.py'
        clang_plugin_name = 'decomposition'

        cwd = os.getcwd()
        os.chdir(Path(__file__).parent.parent)
        clang_plugin = os.path.abspath(clang_plugin)
        autoconf_intercepter = os.path.abspath(autoconf_intercepter)
        os.chdir(cwd)

        intercept = ''
        if intercepter is not None:
            intercept = f'&& echo \\"Intercepting ...\\" && python {intercepter} \\"-IrPath=Saved/tar-{target}\\" '

        autoconf_intercept = ''
        if always_intercept_autoconf:
            autoconf_intercept = f'&& echo \\"Running autoconf intercept ...\\" && python \\"{autoconf_intercepter}\\" \\"-IrPath=Saved/tar-{target}\\" '

        _native_cmd = (f'CC=clang CXX=clang++ ' +
                       f'CFLAGS=\\"-O0 -g '
                       f'-Xclang -load -Xclang {clang_plugin} -Xclang -add-plugin -Xclang {clang_plugin_name} ' +
                       f'-Xclang -plugin-arg-{clang_plugin_name} -Xclang -IrPath=Saved/tar-{target}\\" ' +
                       f'../{configure} {intercept}{autoconf_intercept}' +
                       f'&& intercept-build make -j$(nproc)'
                       )
        if dry_run:
            _native_cmd += ' -n'

        cmd = (f'python ./Launch.py -Verbose '
               f'-RepositoryLocation {directory} '
               f'-BuildCommand "{_native_cmd}" '
               f'-SplitNonCMakeTarName "{target}" '
               f'-OkIfExists -Report -DoAnalyse -DoSplit')
        print(cmd)

        cwd = os.getcwd()
        try:
            os.chdir(Path(__file__).parent.parent)
            os.system(cmd)

        finally:
            os.chdir(cwd)

        return True


examples: list[CMakeRepository] = [

    # Simple library - Impl in header
    SingleHeaderCMakeRepository('https://github.com/nothings/stb', 'stb_perlin.h', '#define STB_PERLIN_IMPLEMENTATION', None, 'stb_perlin'),

    # Header-only library (external vs. internal linkage)
    SingleHeaderCMakeRepository('https://github.com/zserge/jsmn.git', 'jsmn.h', name='jsmn_external'),
    SingleHeaderCMakeRepository('https://github.com/zserge/jsmn.git', 'jsmn.h', '#define JSMN_STATIC', name='jsmn_internal'),

    SingleHeaderCMakeRepository('https://github.com/nothings/stb', 'stb_sprintf.h', '#define STB_SPRINTF_IMPLEMENTATION', None, 'stb_sprintf'),

    # Single header libraries - Impl in header - Extreme high usage of static symbols
    SingleHeaderCMakeRepository('https://github.com/nothings/stb', 'stb_image_write.h', '#define STB_IMAGE_WRITE_IMPLEMENTATION', None, 'stb_image_write'),
    SingleHeaderCMakeRepository('https://github.com/Auburn/FastNoiseLite.git', 'FastNoiseLite.h', '#define FNL_IMPL', 'C'),

    # Single header with heavy macro usage - External library dependency
    GladKhrPlatformRepository(),

    # Uses type recursion and type punning.
    CMakeRepository('https://github.com/DaveGamble/cJSON', 'cjson', cmake_args=['-DCMAKE_POLICY_VERSION_MINIMUM=3.5']),

    # Single medium-sized header library - Impl in header
    SingleHeaderCMakeRepository('https://github.com/nothings/stb', 'stb_image.h', '#define STB_IMAGE_IMPLEMENTATION', None, 'stb_image'),

    CMakeRepository('https://github.com/msgpack/msgpack-c', 'msgpack-c-static', branch='c_master'),

    SingleHeaderCMakeRepository('https://github.com/nothings/stb', 'stb_image_resize2.h', '#define STB_IMAGE_RESIZE_IMPLEMENTATION', None, 'stb_image_resize'),

    CMakeRepository('https://gitlab.com/bzip2/bzip2.git', 'bz2'),

    # DARPA -- M3
    CMakeRepository('https://github.com/yaml/libyaml.git', 'yaml', cmake_args=['-DCMAKE_POLICY_VERSION_MINIMUM=3.5']),

    # DARPA -- M21
    CMakeRepository('https://github.com/madler/zlib', 'zlib'),

    CMakeRepository('https://github.com/libuv/libuv', 'uv_a'),

    SingleHeaderReCMakeRepository('https://github.com/mackron/miniaudio', 'miniaudio.h', '#define MINIAUDIO_IMPLEMENTATION'),

    CMakeRepository('https://github.com/glfw/glfw.git', 'glfw'),

    # Medium complexity
    CMakeRepository('https://github.com/pnggroup/libpng.git', 'png_static'),

    CMakeRepository('git://git.git.savannah.gnu.org/lwip.git', 'lwipcore'),

    # High complexity
    CMakeRepository('https://github.com/freetype/freetype', 'freetype'),

    # Single header + translation library with high complexity
    CMakeRepository('https://github.com/mzoesch/S-Jafg-Sqlite3-Amalgamation.git', 'jafg_sqlite3_amalgamation'),

    # High complexity
    CMakeRepository('https://github.com/curl/curl.git', 'libcurl_shared'),

    # Difference between amalgamation and normal build
    ConfMakeRepository('https://github.com/sqlite/sqlite', 'sqlite3'),

    # Extreme high complexity
    # ConfMakeRepository('https://github.com/apache/httpd.git', 'httpd'),
    # ConfMakeRepository('https://github.com/apache/apr', 'apr'),
    # ConfMakeRepository('https://github.com/openssl/openssl', 'libssl', 'Configure')

    ]


def get_avg_n_without_outliers(path: Path, n: int, display_name: str = 'unknown') -> (str, float):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    units = data.get('Units')
    assert units is not None and isinstance(units, list)

    ns: list[float] = []
    for unit in units:
        unit_n = int(unit.get('N'))
        assert unit_n is not None
        if unit_n <= n:
            ns.append(float(unit_n))
        continue

    if len(ns) == 0:
        return display_name, 0.0
    return display_name, sum(ns) / len(ns)


def evaluate() -> None:
    parser = argparse.ArgumentParser(description='Automation tool.')
    parser.add_argument('-SkipCloned', action='store_true', help='Skip already cloned repositories.')
    parser.add_argument('-Url', type=str, help='URL of the repository to analyse.')
    parser.add_argument('-Name', type=str, help='Name of the repository to analyse.')
    parser.add_argument('-GetAvgNWithoutOutliers', action='store_true', help='Get average N without outliers.')
    parser.add_argument('-GetAvgNWithoutOutliers_Path', type=str, help='Path to Report.json for GetAvgNWithoutOutliers.')
    parser.add_argument('-GetAvgNWithoutOutliers_N', type=int, default=2048, help='N value for GetAvgNWithoutOutliers.')
    args, unknown = parser.parse_known_args(args=sys.argv[1:])

    print('#### Cloning repositories ...')
    for e in examples:
        if args.Url is not None:
            if e.url != args.Url:
                e._skip = True
                continue
        if args.Name is not None:
            if e.name != args.Name:
                e._skip = True
                continue
        if not e.clone():
            if args.SkipCloned:
                e._skip = True
        continue

    errs: list[str] = []

    if args.GetAvgNWithoutOutliers and args.GetAvgNWithoutOutliers_Path is not None:
        try:
            path = Path(args.GetAvgNWithoutOutliers_Path)
            avg_n = get_avg_n_without_outliers(path, args.GetAvgNWithoutOutliers_N, path.parent.name)
            print(f'#### Average N without outliers for [{avg_n[0]}]: {avg_n[1]}')
        except FileNotFoundError:
            print(f'#### Report.json not found, cannot get average N without outliers. Expected at [{args.GetAvgNWithoutOutliers_Path}].')
        return None

    avg_ns: list[tuple[str, float]] = []

    print('#### Analysing and splitting repositories ...')
    for e in examples:
        if e._skip:
            print(f'#### Skipping repository [{e.name}] ...')
            continue

        if args.GetAvgNWithoutOutliers:
            path = e.get_absolute_path() / 'build' / 'Saved' / f'tar-{e.target}' / 'Report.json'
            try:
                avg_ns.append(get_avg_n_without_outliers(path, args.GetAvgNWithoutOutliers_N, e.name))
            except FileNotFoundError:
                errs.append(f'[{e.name}]: Report.json not found, cannot get average N without outliers. Expected at [{path}].')
            continue

        err_msg = None
        rc = e.analyse_and_split()

        if isinstance(rc, tuple):
            _rc, _err_msg = rc
            if not _rc:
                if _err_msg is None:
                    rc = False
                elif len(_err_msg) == 0:
                    err_msg = f'Errors occurred while analysing and splitting repository [{e.name}].'
                else:
                    err_msg = _err_msg

        if isinstance(rc, bool):
            if not rc:
                err_msg = 'Unknown error occurred while analysing and splitting repository.'

        if err_msg is not None:
            print(f'#### {err_msg}')
            errs.append(f'[{e.name}]: {err_msg}')

        continue

    if len(errs) > 0:
        print(f'#### Errors occurred while analysing and splitting the following repositories:')
        for err in errs:
            print(f'####   {err}')

    if args.GetAvgNWithoutOutliers:
        for avg_n in avg_ns:
            print(f'#### Average N without outliers for [{avg_n[0]}]: {avg_n[1]}')
            continue

    return None


if __name__ == "__main__":
    evaluate()
