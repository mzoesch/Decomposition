// SCC: (yaml_parser_parse_stream_start)

int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_parser_set_parser_error(Unknown *parser, const char *problem, Unknown problem_mark);


int yaml_parser_parse_stream_start(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_stream_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0223Scc_yaml_parser_parse_stream_start_yaml_parser_parse_stream_start.fwd"
yaml_parser_parse_stream_start(yaml_parser_t *parser, yaml_event_t *event)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type != YAML_STREAM_START_TOKEN) {
        return yaml_parser_set_parser_error(parser,
                "did not find expected <stream-start>", token->start_mark);
    }

    parser->state = YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE;
    STREAM_START_EVENT_INIT(*event, token->data.stream_start.encoding,
            token->start_mark, token->start_mark);
    SKIP_TOKEN(parser);

    return 1;
}


