// SCC: (yaml_parser_scan_plain_scalar)

#include "0002StructType_struct.yaml_mark_s.h"


void yaml_malloc(unsigned long size);
int yaml_parser_update_buffer(Unknown *parser, unsigned long length);
int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);
int yaml_string_extend(unsigned char *start, unsigned char *pointer, unsigned char *end);
int yaml_string_join(unsigned char *a_start, unsigned char *a_pointer, unsigned char *a_end, unsigned char *b_start, unsigned char *b_pointer, unsigned char *b_end);
void yaml_free(Unknown *ptr);


int yaml_parser_scan_plain_scalar(Unknown *parser, Unknown *token);


// Function: yaml_parser_scan_plain_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0218Scc_yaml_parser_scan_plain_scalar_yaml_parser_scan_plain_scalar.fwd"
yaml_parser_scan_plain_scalar(yaml_parser_t *parser, yaml_token_t *token)
{
    yaml_mark_t start_mark;
    yaml_mark_t end_mark;
    yaml_string_t string = NULL_STRING;
    yaml_string_t leading_break = NULL_STRING;
    yaml_string_t trailing_breaks = NULL_STRING;
    yaml_string_t whitespaces = NULL_STRING;
    int leading_blanks = 0;
    int indent = parser->indent+1;

    if (!STRING_INIT(parser, string, INITIAL_STRING_SIZE)) goto error;
    if (!STRING_INIT(parser, leading_break, INITIAL_STRING_SIZE)) goto error;
    if (!STRING_INIT(parser, trailing_breaks, INITIAL_STRING_SIZE)) goto error;
    if (!STRING_INIT(parser, whitespaces, INITIAL_STRING_SIZE)) goto error;

    start_mark = end_mark = parser->mark;

    /* Consume the content of the plain scalar. */

    while (1)
    {
        /* Check for a document indicator. */

        if (!CACHE(parser, 4)) goto error;

        if (parser->mark.column == 0 &&
            ((CHECK_AT(parser->buffer, '-', 0) &&
              CHECK_AT(parser->buffer, '-', 1) &&
              CHECK_AT(parser->buffer, '-', 2)) ||
             (CHECK_AT(parser->buffer, '.', 0) &&
              CHECK_AT(parser->buffer, '.', 1) &&
              CHECK_AT(parser->buffer, '.', 2))) &&
            IS_BLANKZ_AT(parser->buffer, 3)) break;

        /* Check for a comment. */

        if (CHECK(parser->buffer, '#'))
            break;

        /* Consume non-blank characters. */

        while (!IS_BLANKZ(parser->buffer))
        {
            /* Check for "x:" + one of ',?[]{}' in the flow context. TODO: Fix the test "spec-08-13".
             * This is not completely according to the spec
             * See http://yaml.org/spec/1.1/#id907281 9.1.3. Plain
             */

            if (parser->flow_level
                    && CHECK(parser->buffer, ':')
                    && (
                        CHECK_AT(parser->buffer, ',', 1)
                        || CHECK_AT(parser->buffer, '?', 1)
                        || CHECK_AT(parser->buffer, '[', 1)
                        || CHECK_AT(parser->buffer, ']', 1)
                        || CHECK_AT(parser->buffer, '{', 1)
                        || CHECK_AT(parser->buffer, '}', 1)
                    )
                    ) {
                yaml_parser_set_scanner_error(parser, "while scanning a plain scalar",
                        start_mark, "found unexpected ':'");
                goto error;
            }

            /* Check for indicators that may end a plain scalar. */

            if ((CHECK(parser->buffer, ':') && IS_BLANKZ_AT(parser->buffer, 1))
                    || (parser->flow_level &&
                        (CHECK(parser->buffer, ',')
                         || CHECK(parser->buffer, '[')
                         || CHECK(parser->buffer, ']') || CHECK(parser->buffer, '{')
                         || CHECK(parser->buffer, '}'))))
                break;

            /* Check if we need to join whitespaces and breaks. */

            if (leading_blanks || whitespaces.start != whitespaces.pointer)
            {
                if (leading_blanks)
                {
                    /* Do we need to fold line breaks? */

                    if (leading_break.start[0] == '\n') {
                        if (trailing_breaks.start[0] == '\0') {
                            if (!STRING_EXTEND(parser, string)) goto error;
                            *(string.pointer++) = ' ';
                        }
                        else {
                            if (!JOIN(parser, string, trailing_breaks)) goto error;
                            CLEAR(parser, trailing_breaks);
                        }
                        CLEAR(parser, leading_break);
                    }
                    else {
                        if (!JOIN(parser, string, leading_break)) goto error;
                        if (!JOIN(parser, string, trailing_breaks)) goto error;
                        CLEAR(parser, leading_break);
                        CLEAR(parser, trailing_breaks);
                    }

                    leading_blanks = 0;
                }
                else
                {
                    if (!JOIN(parser, string, whitespaces)) goto error;
                    CLEAR(parser, whitespaces);
                }
            }

            /* Copy the character. */

            if (!READ(parser, string)) goto error;

            end_mark = parser->mark;

            if (!CACHE(parser, 2)) goto error;
        }

        /* Is it the end? */

        if (!(IS_BLANK(parser->buffer) || IS_BREAK(parser->buffer)))
            break;

        /* Consume blank characters. */

        if (!CACHE(parser, 1)) goto error;

        while (IS_BLANK(parser->buffer) || IS_BREAK(parser->buffer))
        {
            if (IS_BLANK(parser->buffer))
            {
                /* Check for tab characters that abuse indentation. */

                if (leading_blanks && (int)parser->mark.column < indent
                        && IS_TAB(parser->buffer)) {
                    yaml_parser_set_scanner_error(parser, "while scanning a plain scalar",
                            start_mark, "found a tab character that violates indentation");
                    goto error;
                }

                /* Consume a space or a tab character. */

                if (!leading_blanks) {
                    if (!READ(parser, whitespaces)) goto error;
                }
                else {
                    SKIP(parser);
                }
            }
            else
            {
                if (!CACHE(parser, 2)) goto error;

                /* Check if it is a first line break. */

                if (!leading_blanks)
                {
                    CLEAR(parser, whitespaces);
                    if (!READ_LINE(parser, leading_break)) goto error;
                    leading_blanks = 1;
                }
                else
                {
                    if (!READ_LINE(parser, trailing_breaks)) goto error;
                }
            }
            if (!CACHE(parser, 1)) goto error;
        }

        /* Check indentation level. */

        if (!parser->flow_level && (int)parser->mark.column < indent)
            break;
    }

    /* Create a token. */

    SCALAR_TOKEN_INIT(*token, string.start, string.pointer-string.start,
            YAML_PLAIN_SCALAR_STYLE, start_mark, end_mark);

    /* Note that we change the 'simple_key_allowed' flag. */

    if (leading_blanks) {
        parser->simple_key_allowed = 1;
    }

    STRING_DEL(parser, leading_break);
    STRING_DEL(parser, trailing_breaks);
    STRING_DEL(parser, whitespaces);

    return 1;

error:
    STRING_DEL(parser, string);
    STRING_DEL(parser, leading_break);
    STRING_DEL(parser, trailing_breaks);
    STRING_DEL(parser, whitespaces);

    return 0;
}


