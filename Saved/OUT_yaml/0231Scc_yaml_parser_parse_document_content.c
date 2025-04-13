// SCC: (yaml_parser_parse_document_content)

int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);


int yaml_parser_parse_document_content(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_document_content
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0231Scc_yaml_parser_parse_document_content_yaml_parser_parse_document_content.fwd"
yaml_parser_parse_document_content(yaml_parser_t *parser, yaml_event_t *event)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type == YAML_VERSION_DIRECTIVE_TOKEN ||
            token->type == YAML_TAG_DIRECTIVE_TOKEN ||
            token->type == YAML_DOCUMENT_START_TOKEN ||
            token->type == YAML_DOCUMENT_END_TOKEN ||
            token->type == YAML_STREAM_END_TOKEN) {
        parser->state = POP(parser, parser->states);
        return yaml_parser_process_empty_scalar(parser, event,
                token->start_mark);
    }
    else {
        return yaml_parser_parse_node(parser, event, 1, 0);
    }
}


