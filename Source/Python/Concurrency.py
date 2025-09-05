import asyncio
import sys
from Source.Python.Globals import Globals


async def _run(cmd):
    proc = await asyncio.create_subprocess_shell(
        cmd,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE
    )
    stdout, stderr = await proc.communicate()
    return cmd, proc.returncode, stdout.decode(), stderr.decode()


async def _run_concurrent_impl(g: Globals, cursor: int, display_name_max: int, nproc: int, cmds: list[tuple[str, str]]) -> any:
    active = set()
    cmd_iter = iter(cmds)

    for _ in range(min(nproc, len(cmds))):
        cmd = next(cmd_iter, None)
        if cmd:
            name, c = cmd

            task = asyncio.create_task(_run(c))
            print(f'[{cursor:0{len(str(display_name_max))}}/{display_name_max}] {name}')
            active.add(task)

            cursor += 1

        continue

    sys.stdout.flush()

    results = []
    while active:
        done, pending = await asyncio.wait(active, return_when=asyncio.FIRST_COMPLETED)

        for task in done:
            results.append(task.result())
            active.remove(task)

            cmd = next(cmd_iter, None)
            if cmd:
                name, c = cmd
                new_task = asyncio.create_task(_run(c))
                print(f'[{cursor:0{len(str(display_name_max))}}/{display_name_max}] {name}', flush=True)
                active.add(new_task)

                cursor += 1

            continue

    return results


def run_concurrent(g: Globals, cursor: int, display_name_max: int, nproc: int, cmds: list[tuple[str, str]]) -> any:
    assert nproc > 0
    assert cursor <= display_name_max

    return asyncio.run(_run_concurrent_impl(g, cursor, display_name_max, nproc, cmds))
