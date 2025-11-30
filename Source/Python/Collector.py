from Source.Python.Globals import Globals
from Source.Python.Exporter import Exporter
from Source.Python.Elements import UnitRecord, UnitTypedef, UnitVariable, UnitFunction
from Source.Python.Locations import SourceLocation


def collect_records(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Records;""")

    rows = e.con.fetchall()
    for ident, source, line, column, rline, rcolumn, ty, enum, kw_ppp in rows:
        kw_ppp = bool(kw_ppp)
        e.stats.original_record_count += 1
        e.make_unit(UnitRecord(ident,
            SourceLocation(e.get_or_register_source_file(source), line, column),
            SourceLocation(e.get_or_register_source_file(source), rline, rcolumn),
            ty, enum, kw_ppp))
        continue

    return None


def collect_typedefs(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Typedefs;""")

    rows = e.con.fetchall()
    for ident, source, line, column, what, ty, no_tag, no_tag_line, no_tag_column, r_no_tag_line, r_no_tag_column in rows:
        no_tag = bool(no_tag)
        e.stats.original_typedef_count += 1
        e.make_unit(UnitTypedef(
            ident,
            SourceLocation(e.get_or_register_source_file(source), line, column),
            what, ty, no_tag,
            no_tag_line, no_tag_column,
            r_no_tag_line, r_no_tag_column
            ))
        continue

    return None


def collect_variables(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Variables;""")

    rows = e.con.fetchall()
    for ident, source, line, column, ty, static, extern, init in rows:
        static = bool(static)
        extern = bool(extern)
        e.stats.original_variable_count += 1
        e.make_unit(UnitVariable(ident, SourceLocation(e.get_or_register_source_file(source), line, column),
            ty, static, extern, init))
        continue

    return None


def collect_functions(g: Globals, e: Exporter) -> None:
    e.con.execute_ro("""SELECT * FROM Functions;""")

    rows = e.con.fetchall()
    for ident, source, line, column, rline, rcolumn, static, params, ret, ret_ppp in rows:
        static = bool(static)
        ret_ppp = bool(ret_ppp)
        e.stats.original_function_count += 1
        e.make_unit(UnitFunction(ident,
                SourceLocation(e.get_or_register_source_file(source), line, column),
                SourceLocation(e.get_or_register_source_file(source), rline, rcolumn),
            params, static, ret, ret_ppp))
        continue

    return None
