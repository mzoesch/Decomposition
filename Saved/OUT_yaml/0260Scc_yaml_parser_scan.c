// SCC: (yaml_parser_scan)

int yaml_parser_fetch_more_tokens(Unknown *parser);


int yaml_parser_scan(Unknown *parser, Unknown *token);


// Function: yaml_parser_scan
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0260Scc_yaml_parser_scan_yaml_parser_scan.fwd"
yaml_parser_scan(yaml_parser_t *parser, yaml_token_t *token)
{
    assert(parser); /* Non-NULL parser object is expected. */
    assert(token);  /* Non-NULL token object is expected. */

    /* Erase the token object. */

    memset(token, 0, sizeof(yaml_token_t));

    /* No tokens after STREAM-END or error. */

    if (parser->stream_end_produced || parser->error) {
        return 1;
    }

    /* Ensure that the tokens queue contains enough tokens. */

    if (!parser->token_available) {
        if (!yaml_parser_fetch_more_tokens(parser))
            return 0;
    }

    /* Fetch the next token from the queue. */

    *token = DEQUEUE(parser, parser->tokens);
    parser->token_available = 0;
    parser->tokens_parsed ++;

    if (token->type == YAML_STREAM_END_TOKEN) {
        parser->stream_end_produced = 1;
    }

    return 1;
}


