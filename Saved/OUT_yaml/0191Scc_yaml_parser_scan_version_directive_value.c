// SCC: (yaml_parser_scan_version_directive_value)

int yaml_parser_update_buffer(Unknown *parser, unsigned long length);
int yaml_parser_scan_version_directive_number(Unknown *parser, Unknown start_mark, int *number);
int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);


int yaml_parser_scan_version_directive_value(Unknown *parser, Unknown start_mark, int *major, int *minor);


// Function: yaml_parser_scan_version_directive_value
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0191Scc_yaml_parser_scan_version_directive_value_yaml_parser_scan_version_directive_value.fwd"
yaml_parser_scan_version_directive_value(yaml_parser_t *parser,
        yaml_mark_t start_mark, int *major, int *minor)
{
    /* Eat whitespaces. */

    if (!CACHE(parser, 1)) return 0;

    while (IS_BLANK(parser->buffer)) {
        SKIP(parser);
        if (!CACHE(parser, 1)) return 0;
    }

    /* Consume the major version number. */

    if (!yaml_parser_scan_version_directive_number(parser, start_mark, major))
        return 0;

    /* Eat '.'. */

    if (!CHECK(parser->buffer, '.')) {
        return yaml_parser_set_scanner_error(parser, "while scanning a %YAML directive",
                start_mark, "did not find expected digit or '.' character");
    }

    SKIP(parser);

    /* Consume the minor version number. */

    if (!yaml_parser_scan_version_directive_number(parser, start_mark, minor))
        return 0;

    return 1;
}


