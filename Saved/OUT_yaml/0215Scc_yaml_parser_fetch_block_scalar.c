// SCC: (yaml_parser_fetch_block_scalar)

#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_remove_simple_key(Unknown *parser);
int yaml_parser_scan_block_scalar(Unknown *parser, Unknown *token, int literal);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);
void yaml_token_delete(Unknown *token);


int yaml_parser_fetch_block_scalar(Unknown *parser, int literal);


// Function: yaml_parser_fetch_block_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0215Scc_yaml_parser_fetch_block_scalar_yaml_parser_fetch_block_scalar.fwd"
yaml_parser_fetch_block_scalar(yaml_parser_t *parser, int literal)
{
    yaml_token_t token;

    /* Remove any potential simple keys. */

    if (!yaml_parser_remove_simple_key(parser))
        return 0;

    /* A simple key may follow a block scalar. */

    parser->simple_key_allowed = 1;

    /* Create the SCALAR token and append it to the queue. */

    if (!yaml_parser_scan_block_scalar(parser, &token, literal))
        return 0;

    if (!ENQUEUE(parser, parser->tokens, token)) {
        yaml_token_delete(&token);
        return 0;
    }

    return 1;
}


