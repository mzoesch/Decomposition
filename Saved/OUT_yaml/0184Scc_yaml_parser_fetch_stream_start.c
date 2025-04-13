// SCC: (yaml_parser_fetch_stream_start)

#include "0003StructType_struct.yaml_token_s.h"
#include "0004StructType_struct.yaml_simple_key_s.h"


int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);


int yaml_parser_fetch_stream_start(Unknown *parser);


// Function: yaml_parser_fetch_stream_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0184Scc_yaml_parser_fetch_stream_start_yaml_parser_fetch_stream_start.fwd"
yaml_parser_fetch_stream_start(yaml_parser_t *parser)
{
    yaml_simple_key_t simple_key = { 0, 0, 0, { 0, 0, 0 } };
    yaml_token_t token;

    /* Set the initial indentation. */

    parser->indent = -1;

    /* Initialize the simple key stack. */

    if (!PUSH(parser, parser->simple_keys, simple_key))
        return 0;

    /* A simple key is allowed at the beginning of the stream. */

    parser->simple_key_allowed = 1;

    /* We have started. */

    parser->stream_start_produced = 1;

    /* Create the STREAM-START token and append it to the queue. */

    STREAM_START_TOKEN_INIT(token, parser->encoding,
            parser->mark, parser->mark);

    if (!ENQUEUE(parser, parser->tokens, token))
        return 0;

    return 1;
}


