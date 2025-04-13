// SCC: (yaml_parser_fetch_flow_scalar)

#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_save_simple_key(Unknown *parser);
int yaml_parser_scan_flow_scalar(Unknown *parser, Unknown *token, int single);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);
void yaml_token_delete(Unknown *token);


int yaml_parser_fetch_flow_scalar(Unknown *parser, int single);


// Function: yaml_parser_fetch_flow_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0217Scc_yaml_parser_fetch_flow_scalar_yaml_parser_fetch_flow_scalar.fwd"
yaml_parser_fetch_flow_scalar(yaml_parser_t *parser, int single)
{
    yaml_token_t token;

    /* A plain scalar could be a simple key. */

    if (!yaml_parser_save_simple_key(parser))
        return 0;

    /* A simple key cannot follow a flow scalar. */

    parser->simple_key_allowed = 0;

    /* Create the SCALAR token and append it to the queue. */

    if (!yaml_parser_scan_flow_scalar(parser, &token, single))
        return 0;

    if (!ENQUEUE(parser, parser->tokens, token)) {
        yaml_token_delete(&token);
        return 0;
    }

    return 1;
}


