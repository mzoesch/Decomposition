import os
from Source.Python.Globals import Globals
from Source.Python.Tasks import run_any_task


def setup_environment(g: Globals) -> None:
    """
    Step Zero.
    """

    if not os.path.exists(g.args.EnvBuildDir):
        os.makedirs(g.args.EnvBuildDir)

    run_any_task(
        'cmake', '..',
        '-DCMAKE_C_COMPILER={}'.format(g.args.ClangCompiler),
        '-DCMAKE_CXX_COMPILER={}'.format(g.args.ClangCompilerXX),
        '-DCMAKE_BUILD_TYPE={}'.format(g.args.EnvConfig),
        wd=g.args.EnvBuildDir
        )
    run_any_task('make', '-j$(nproc)', wd=g.args.EnvBuildDir, shell=True)

    return None
