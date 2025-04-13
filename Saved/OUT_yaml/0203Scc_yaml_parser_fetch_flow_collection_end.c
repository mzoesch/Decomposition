// SCC: (yaml_parser_fetch_flow_collection_end)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_remove_simple_key(Unknown *parser);
int yaml_parser_decrease_flow_level(Unknown *parser);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);


int yaml_parser_fetch_flow_collection_end(Unknown *parser, Unknown type);


// Function: yaml_parser_fetch_flow_collection_end
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0203Scc_yaml_parser_fetch_flow_collection_end_yaml_parser_fetch_flow_collection_end.fwd"
yaml_parser_fetch_flow_collection_end(yaml_parser_t *parser,
        yaml_token_type_t type)
{
    yaml_mark_t start_mark, end_mark;
    yaml_token_t token;

    /* Reset any potential simple key on the current flow level. */

    if (!yaml_parser_remove_simple_key(parser))
        return 0;

    /* Decrease the flow level. */

    if (!yaml_parser_decrease_flow_level(parser))
        return 0;

    /* No simple keys after the indicators ']' and '}'. */

    parser->simple_key_allowed = 0;

    /* Consume the token. */

    start_mark = parser->mark;
    SKIP(parser);
    end_mark = parser->mark;

    /* Create the FLOW-SEQUENCE-END of FLOW-MAPPING-END token. */

    TOKEN_INIT(token, type, start_mark, end_mark);

    /* Append the token to the queue. */

    if (!ENQUEUE(parser, parser->tokens, token))
        return 0;

    return 1;
}

/*
 * Produce the FLOW-ENTRY token.
 */

static int
yaml_parser_fetch_flow_entry(yaml_parser_t *parser)
{
    yaml_mark_t start_mark, end_mark;
    yaml_token_t token;

    /* Reset any potential simple keys on the current flow level. */

    if (!yaml_parser_remove_simple_key(parser))
        return 0;

    /* Simple keys are allowed after ','. */

    parser->simple_key_allowed = 1;

    /* Consume the token. */

    start_mark = parser->mark;
    SKIP(parser);
    end_mark = parser->mark;

    /* Create the FLOW-ENTRY token and append it to the queue. */

    TOKEN_INIT(token, YAML_FLOW_ENTRY_TOKEN, start_mark, end_mark);

    if (!ENQUEUE(parser, parser->tokens, token))
        return 0;

    return 1;
}

/*
 * Produce the BLOCK-ENTRY token.
 */

static int
yaml_parser_fetch_block_entry(yaml_parser_t *parser)
{
    yaml_mark_t start_mark, end_mark;
    yaml_token_t token;

    /* Check if the scanner is in the block context. */

    if (!parser->flow_level)
    {
        /* Check if we are allowed to start a new entry. */

        if (!parser->simple_key_allowed) {
            return yaml_parser_set_scanner_error(parser, NULL, parser->mark,
                    "block sequence entries are not allowed in this context");
        }

        /* Add the BLOCK-SEQUENCE-START token if needed. */

        if (!yaml_parser_roll_indent(parser, parser->mark.column, -1,
                    YAML_BLOCK_SEQUENCE_START_TOKEN, parser->mark))
            return 0;
    }


