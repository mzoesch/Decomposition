// SCC: (yaml_parser_fetch_tag)

#include "0003StructType_struct.yaml_token_s.h"


int yaml_parser_save_simple_key(Unknown *parser);
int yaml_parser_scan_tag(Unknown *parser, Unknown *token);
int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);
void yaml_token_delete(Unknown *token);


int yaml_parser_fetch_tag(Unknown *parser);


// Function: yaml_parser_fetch_tag
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0212Scc_yaml_parser_fetch_tag_yaml_parser_fetch_tag.fwd"
yaml_parser_fetch_tag(yaml_parser_t *parser)
{
    yaml_token_t token;

    /* A tag could be a simple key. */

    if (!yaml_parser_save_simple_key(parser))
        return 0;

    /* A simple key cannot follow a tag. */

    parser->simple_key_allowed = 0;

    /* Create the TAG token and append it to the queue. */

    if (!yaml_parser_scan_tag(parser, &token))
        return 0;

    if (!ENQUEUE(parser, parser->tokens, token)) {
        yaml_token_delete(&token);
        return 0;
    }

    return 1;
}


