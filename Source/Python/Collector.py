from Source.Python.Globals import Globals
from Source.Python.Exporter import Exporter
from Source.Python.Elements import UnitRecord, UnitTypedef, UnitVariable, UnitFunction
from Source.Python.Locations import SourceLocation


def collect_records(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Records;""")

    rows = e.con.fetchall()
    for ident, source, line, column, rline, rcolumn, ty, enum in rows:
        e.stats.original_record_count += 1
        e.make_unit(UnitRecord(ident,
            SourceLocation(e.get_or_register_source_file(source), line, column),
            SourceLocation(e.get_or_register_source_file(source), rline, rcolumn),
            ty, enum))
        continue

    return None


def collect_typedefs(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Typedefs;""")

    rows = e.con.fetchall()
    for ident, source, line, column, what, ty, anonymous, anonymous_begin_line, anonymous_begin_column in rows:
        anonymous = bool(anonymous)
        e.stats.original_typedef_count += 1
        e.make_unit(UnitTypedef(ident, SourceLocation(e.get_or_register_source_file(source), line, column),
            what, ty, anonymous, anonymous_begin_line, anonymous_begin_column))
        continue

    return None


def collect_variables(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Variables;""")

    rows = e.con.fetchall()
    for ident, source, line, column, ty, static, extern in rows:
        static = bool(static)
        extern = bool(extern)
        e.stats.original_variable_count += 1
        e.make_unit(UnitVariable(ident, SourceLocation(e.get_or_register_source_file(source), line, column),
            ty, static, extern))
        continue

    return None


def collect_functions(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Functions;""")

    rows = e.con.fetchall()
    for ident, source, line, column, rline, rcolumn, static, params, ret in rows:
        static = bool(static)
        e.stats.original_function_count += 1
        e.make_unit(UnitFunction(ident,
                SourceLocation(e.get_or_register_source_file(source), line, column),
                SourceLocation(e.get_or_register_source_file(source), rline, rcolumn),
            params, static, ret))
        continue

    return None
