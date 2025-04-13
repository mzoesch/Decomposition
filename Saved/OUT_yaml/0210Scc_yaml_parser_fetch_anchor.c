// SCC: (yaml_parser_fetch_anchor)

#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_save_simple_key(Unknown *parser);
int yaml_parser_scan_anchor(Unknown *parser, Unknown *token, Unknown type);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);
void yaml_token_delete(Unknown *token);


int yaml_parser_fetch_anchor(Unknown *parser, Unknown type);


// Function: yaml_parser_fetch_anchor
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0210Scc_yaml_parser_fetch_anchor_yaml_parser_fetch_anchor.fwd"
yaml_parser_fetch_anchor(yaml_parser_t *parser, yaml_token_type_t type)
{
    yaml_token_t token;

    /* An anchor or an alias could be a simple key. */

    if (!yaml_parser_save_simple_key(parser))
        return 0;

    /* A simple key cannot follow an anchor or an alias. */

    parser->simple_key_allowed = 0;

    /* Create the ALIAS or ANCHOR token and append it to the queue. */

    if (!yaml_parser_scan_anchor(parser, &token, type))
        return 0;

    if (!ENQUEUE(parser, parser->tokens, token)) {
        yaml_token_delete(&token);
        return 0;
    }
    return 1;
}


