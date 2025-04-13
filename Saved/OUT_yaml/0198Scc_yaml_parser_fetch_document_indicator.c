// SCC: (yaml_parser_fetch_document_indicator)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_unroll_indent(Unknown *parser, long column);
int yaml_parser_remove_simple_key(Unknown *parser);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);


int yaml_parser_fetch_document_indicator(Unknown *parser, Unknown type);


// Function: yaml_parser_fetch_document_indicator
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0198Scc_yaml_parser_fetch_document_indicator_yaml_parser_fetch_document_indicator.fwd"
yaml_parser_fetch_document_indicator(yaml_parser_t *parser,
        yaml_token_type_t type)
{
    yaml_mark_t start_mark, end_mark;
    yaml_token_t token;

    /* Reset the indentation level. */

    if (!yaml_parser_unroll_indent(parser, -1))
        return 0;

    /* Reset simple keys. */

    if (!yaml_parser_remove_simple_key(parser))
        return 0;

    parser->simple_key_allowed = 0;

    /* Consume the token. */

    start_mark = parser->mark;

    SKIP(parser);
    SKIP(parser);
    SKIP(parser);

    end_mark = parser->mark;

    /* Create the DOCUMENT-START or DOCUMENT-END token. */

    TOKEN_INIT(token, type, start_mark, end_mark);

    /* Append the token to the queue. */

    if (!ENQUEUE(parser, parser->tokens, token))
        return 0;

    return 1;
}


