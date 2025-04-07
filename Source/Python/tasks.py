import os
import sys
import threading
import subprocess
import time


class MyOutCapture:
    """
    Helper class to capture async stdout.
    """

    stdout: str = None

    def __init__(self):
        self.stdout = ""

    def append(self, line: str):
        self.stdout += line

    def print(self):
        print(self.stdout)


def _stream_output(stream, output_func) -> None:
    try:
        for line in iter(stream.readline, ''):
            output_func(line)
            sys.stdout.flush()
    except UnicodeDecodeError as e:
        print(f'Error decoding stream: {e}')
        print('Ignoring stream.')
    finally:
        stream.close()

    return None


def _copy_and_print(line, copied_stdout) -> None:
    print(line, end='')
    if copied_stdout is not None:
        copied_stdout.append(line)

    return None


def run_any_task(*args, wd=None, env=None, shell=False) -> None:
    """
    Emits live output of the stdout / stderr.
    """

    cwd = None
    if wd is not None:
        cwd = os.getcwd()
        os.chdir(wd)
        print(f'Changed working directory from [{cwd}] to [{os.getcwd()}] to execute subprocess.')

    print(f'Running subprocess with args [{" ".join(args)}].')
    try:
        with subprocess.Popen(
                args,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                env=env,
                shell=shell,
        ) as p:
            stdout_thread = threading.Thread(
                target=_stream_output,
                args=(p.stdout, lambda line: print(line, end=''))
                )
            stderr_thread = threading.Thread(
                target=_stream_output,
                args=(p.stderr, lambda line: print(line, end=''))
                )

            stdout_thread.start()
            stderr_thread.start()
            p.wait()
            stdout_thread.join()
            stderr_thread.join()

            if p.returncode != 0:
                print(f'Subprocess failed with {p.returncode=}.')
                if cwd is not None:
                    os.chdir(cwd)
                    cwd = None
                    print(f'Popped working directory to [{os.getcwd()}].')
                sys.exit(p.returncode)
    finally:
        if cwd is not None:
            os.chdir(cwd)
            cwd=None
            print(f'Popped working directory to [{os.getcwd()}].')

    return None


def run_any_task_with_stdout(copied_stdout: MyOutCapture, *args, wd=None, env=None, shell=False) -> None:
    """
    Emits live output of the stdout / stderr.
    """

    cwd = None
    if wd is not None:
        cwd = os.getcwd()
        os.chdir(wd)
        print(f'Changed working directory from [{cwd}] to [{os.getcwd()}] to execute subprocess.')

    print(f'Running subprocess with args [{" ".join(args)}].')
    try:
        with subprocess.Popen(
                args,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                env=env,
                text=shell,
                shell=shell,
        ) as p:

            stdout_thread = threading.Thread(
                target=_stream_output,
                args=(p.stdout, lambda line: _copy_and_print(line, copied_stdout))
                )
            stderr_thread = threading.Thread(
                target=_stream_output,
                args=(p.stderr, lambda line: _copy_and_print(line, copied_stdout))
                )

            stdout_thread.start()
            stderr_thread.start()
            p.wait()
            stdout_thread.join()
            stderr_thread.join()

            if p.returncode != 0:
                print(f'Subprocess failed with {p.returncode=}.')
                if cwd is not None:
                    os.chdir(cwd)
                    cwd = None
                    print(f'Popped working directory to [{os.getcwd()}].')
                sys.exit(p.returncode)
    finally:
        if cwd is not None:
            os.chdir(cwd)
            cwd=None
            print(f'Popped working directory to [{os.getcwd()}].')

    return None


def run_any_task_ok_to_fail(*args, wd=None, env=None, shell=False) -> int:
    """
    Emits live output of the stdout / stderr.
    """

    cwd = None
    if wd is not None:
        cwd = os.getcwd()
        os.chdir(wd)
        print(f'Changed working directory from [{cwd}] to [{os.getcwd()}] to execute subprocess.')

    print(f'Running subprocess with args [{" ".join(args)}].')
    with subprocess.Popen(
            args,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            shell=shell,
    ) as p:
        stdout_thread = threading.Thread(
            target=_stream_output,
            args=(p.stdout, lambda line: print(line, end='')))
        stderr_thread = threading.Thread(
            target=_stream_output,
            args=(p.stderr, lambda line: print(line, end=''))
            )

        stdout_thread.start()
        stderr_thread.start()
        p.wait()
        stdout_thread.join()
        stderr_thread.join()

        if p.returncode != 0:
            print(f'Subprocess failed with {p.returncode=}.')
            if cwd is not None:
                os.chdir(cwd)
                cwd=None
                print(f'Popped working directory to [{os.getcwd()}].')
            return p.returncode

    if cwd is not None:
        os.chdir(cwd)
        cwd=None
        print(f'Popped working directory to [{os.getcwd()}].')

    return 0


def run_any_task_with_stdout_ok_to_fail(copied_stdout, *args, wd=None, env=None, shell=False) -> int:
    """
    Emits live output of the stdout / stderr.
    """

    cwd = None
    if wd is not None:
        cwd = os.getcwd()
        os.chdir(wd)
        print(f'Changed working directory from [{cwd}] to [{os.getcwd()}] to execute subprocess.')

    print(f'Running subprocess with args [{" ".join(args)}].')
    with subprocess.Popen(
            args,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=env,
            shell=shell,
    ) as p:

        stdout_thread = threading.Thread(
            target=_stream_output,
            args=(p.stdout, lambda line: _copy_and_print(line, copied_stdout))
            )
        stderr_thread = threading.Thread(
            target=_stream_output,
            args=(p.stderr, lambda line: _copy_and_print(line, copied_stdout))
            )

        stdout_thread.start()
        stderr_thread.start()
        p.wait()
        stdout_thread.join()
        stderr_thread.join()

        if p.returncode != 0:
            print(f'Subprocess failed with {p.returncode=}.')
            if cwd is not None:
                os.chdir(cwd)
                cwd=None
                print(f'Popped working directory to [{os.getcwd()}].')
            return p.returncode

    if cwd is not None:
        os.chdir(cwd)
        cwd=None
        print(f'Popped working directory to [{os.getcwd()}].')

    return 0


def run_any_task_no_stdout(*args, wd=None, env=None, shell=False) -> int:
    """
    Does not emit live output of the stdout / stderr.
    """

    cwd = None
    if wd is not None:
        cwd = os.getcwd()
        os.chdir(wd)
        print(f'Changed working directory from [{cwd}] to [{os.getcwd()}] to execute subprocess.')

    print(f'Running subprocess with args [{" ".join(args)}].')
    try:
        with subprocess.Popen(
                args,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                env=env,
                shell=shell,
        ) as p:
            start: float = time.time()
            p.wait()
            print(f'Subprocess took {time.time() - start:.3f} seconds to complete.')

            if p.returncode != 0:
                print(f'Subprocess failed with {p.returncode=}.')
                if cwd is not None:
                    os.chdir(cwd)
                    cwd = None
                    print(f'Popped working directory to [{os.getcwd()}].')
                sys.exit(p.returncode)
    finally:
        if cwd is not None:
            os.chdir(cwd)
            cwd=None
            print(f'Popped working directory to [{os.getcwd()}].')

    return 0
