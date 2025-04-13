// SCC: (yaml_parser_scan_tag_directive_value)

int yaml_parser_update_buffer(Unknown *parser, unsigned long length);
int yaml_parser_scan_tag_handle(Unknown *parser, int directive, Unknown start_mark, unsigned char *handle);
int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);
int yaml_parser_scan_tag_uri(Unknown *parser, int uri_char, int directive, unsigned char *head, Unknown start_mark, unsigned char *uri);
void yaml_free(Unknown *ptr);


int yaml_parser_scan_tag_directive_value(Unknown *parser, Unknown start_mark, unsigned char *handle, unsigned char *prefix);


// Function: yaml_parser_scan_tag_directive_value
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0195Scc_yaml_parser_scan_tag_directive_value_yaml_parser_scan_tag_directive_value.fwd"
yaml_parser_scan_tag_directive_value(yaml_parser_t *parser,
        yaml_mark_t start_mark, yaml_char_t **handle, yaml_char_t **prefix)
{
    yaml_char_t *handle_value = NULL;
    yaml_char_t *prefix_value = NULL;

    /* Eat whitespaces. */

    if (!CACHE(parser, 1)) goto error;

    while (IS_BLANK(parser->buffer)) {
        SKIP(parser);
        if (!CACHE(parser, 1)) goto error;
    }

    /* Scan a handle. */

    if (!yaml_parser_scan_tag_handle(parser, 1, start_mark, &handle_value))
        goto error;

    /* Expect a whitespace. */

    if (!CACHE(parser, 1)) goto error;

    if (!IS_BLANK(parser->buffer)) {
        yaml_parser_set_scanner_error(parser, "while scanning a %TAG directive",
                start_mark, "did not find expected whitespace");
        goto error;
    }

    /* Eat whitespaces. */

    while (IS_BLANK(parser->buffer)) {
        SKIP(parser);
        if (!CACHE(parser, 1)) goto error;
    }

    /* Scan a prefix. */

    if (!yaml_parser_scan_tag_uri(parser, 1, 1, NULL, start_mark, &prefix_value))
        goto error;

    /* Expect a whitespace or line break. */

    if (!CACHE(parser, 1)) goto error;

    if (!IS_BLANKZ(parser->buffer)) {
        yaml_parser_set_scanner_error(parser, "while scanning a %TAG directive",
                start_mark, "did not find expected whitespace or line break");
        goto error;
    }

    *handle = handle_value;
    *prefix = prefix_value;

    return 1;

error:
    yaml_free(handle_value);
    yaml_free(prefix_value);
    return 0;
}


