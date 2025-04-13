// SCC: (yaml_parser_scan_block_scalar_breaks)

int yaml_parser_update_buffer(Unknown *parser, unsigned long length);
int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);
int yaml_string_extend(unsigned char *start, unsigned char *pointer, unsigned char *end);


int yaml_parser_scan_block_scalar_breaks(Unknown *parser, int *indent, Unknown *breaks, Unknown start_mark, Unknown *end_mark);


// Function: yaml_parser_scan_block_scalar_breaks
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0213Scc_yaml_parser_scan_block_scalar_breaks_yaml_parser_scan_block_scalar_breaks.fwd"
yaml_parser_scan_block_scalar_breaks(yaml_parser_t *parser,
        int *indent, yaml_string_t *breaks,
        yaml_mark_t start_mark, yaml_mark_t *end_mark)
{
    int max_indent = 0;

    *end_mark = parser->mark;

    /* Eat the indentation spaces and line breaks. */

    while (1)
    {
        /* Eat the indentation spaces. */

        if (!CACHE(parser, 1)) return 0;

        while ((!*indent || (int)parser->mark.column < *indent)
                && IS_SPACE(parser->buffer)) {
            SKIP(parser);
            if (!CACHE(parser, 1)) return 0;
        }

        if ((int)parser->mark.column > max_indent)
            max_indent = (int)parser->mark.column;

        /* Check for a tab character messing the indentation. */

        if ((!*indent || (int)parser->mark.column < *indent)
                && IS_TAB(parser->buffer)) {
            return yaml_parser_set_scanner_error(parser, "while scanning a block scalar",
                    start_mark, "found a tab character where an indentation space is expected");
        }

        /* Have we found a non-empty line? */

        if (!IS_BREAK(parser->buffer)) break;

        /* Consume the line break. */

        if (!CACHE(parser, 2)) return 0;
        if (!READ_LINE(parser, *breaks)) return 0;
        *end_mark = parser->mark;
    }

    /* Determine the indentation level if needed. */

    if (!*indent) {
        *indent = max_indent;
        if (*indent < parser->indent + 1)
            *indent = parser->indent + 1;
        if (*indent < 1)
            *indent = 1;
    }

   return 1;
}


