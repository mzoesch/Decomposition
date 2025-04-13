// SCC: (yaml_parser_scan_directive_name)

void yaml_malloc(unsigned long size);
int yaml_parser_update_buffer(Unknown *parser, unsigned long length);
int yaml_string_extend(unsigned char *start, unsigned char *pointer, unsigned char *end);
int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);
void yaml_free(Unknown *ptr);


int yaml_parser_scan_directive_name(Unknown *parser, Unknown start_mark, unsigned char *name);


// Function: yaml_parser_scan_directive_name
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0189Scc_yaml_parser_scan_directive_name_yaml_parser_scan_directive_name.fwd"
yaml_parser_scan_directive_name(yaml_parser_t *parser,
        yaml_mark_t start_mark, yaml_char_t **name)
{
    yaml_string_t string = NULL_STRING;

    if (!STRING_INIT(parser, string, INITIAL_STRING_SIZE)) goto error;

    /* Consume the directive name. */

    if (!CACHE(parser, 1)) goto error;

    while (IS_ALPHA(parser->buffer))
    {
        if (!READ(parser, string)) goto error;
        if (!CACHE(parser, 1)) goto error;
    }

    /* Check if the name is empty. */

    if (string.start == string.pointer) {
        yaml_parser_set_scanner_error(parser, "while scanning a directive",
                start_mark, "could not find expected directive name");
        goto error;
    }

    /* Check for an blank character after the name. */

    if (!IS_BLANKZ(parser->buffer)) {
        yaml_parser_set_scanner_error(parser, "while scanning a directive",
                start_mark, "found unexpected non-alphabetical character");
        goto error;
    }

    *name = string.start;

    return 1;

error:
    STRING_DEL(parser, string);
    return 0;
}


