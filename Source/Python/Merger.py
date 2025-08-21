from Source.Python.Globals import Globals
from Source.Python.Exporter import Exporter

def merge(g: Globals, e: Exporter) -> None:
    if g.args.SkipMerge:
        if g.args.Verbose:
            print('Skipping merge step.')
        return None

    if g.args.Verbose:
        print('Running merge step.')

    return None
