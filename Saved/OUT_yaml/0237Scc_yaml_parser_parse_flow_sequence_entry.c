// SCC: (yaml_parser_parse_flow_sequence_entry)

int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_set_parser_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);


int yaml_parser_parse_flow_sequence_entry(Unknown *parser, Unknown *event, int first);


// Function: yaml_parser_parse_flow_sequence_entry
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0237Scc_yaml_parser_parse_flow_sequence_entry_yaml_parser_parse_flow_sequence_entry.fwd"
yaml_parser_parse_flow_sequence_entry(yaml_parser_t *parser,
        yaml_event_t *event, int first)
{
    yaml_token_t *token;

    if (first) {
        token = PEEK_TOKEN(parser);
        if (!PUSH(parser, parser->marks, token->start_mark))
            return 0;
        SKIP_TOKEN(parser);
    }

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type != YAML_FLOW_SEQUENCE_END_TOKEN)
    {
        if (!first) {
            if (token->type == YAML_FLOW_ENTRY_TOKEN) {
                SKIP_TOKEN(parser);
                token = PEEK_TOKEN(parser);
                if (!token) return 0;
            }
            else {
                return yaml_parser_set_parser_error_context(parser,
                        "while parsing a flow sequence", POP(parser, parser->marks),
                        "did not find expected ',' or ']'", token->start_mark);
            }
        }

        if (token->type == YAML_KEY_TOKEN) {
            parser->state = YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE;
            MAPPING_START_EVENT_INIT(*event, NULL, NULL,
                    1, YAML_FLOW_MAPPING_STYLE,
                    token->start_mark, token->end_mark);
            SKIP_TOKEN(parser);
            return 1;
        }

        else if (token->type != YAML_FLOW_SEQUENCE_END_TOKEN) {
            if (!PUSH(parser, parser->states,
                        YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE))
                return 0;
            return yaml_parser_parse_node(parser, event, 0, 0);
        }
    }

    parser->state = POP(parser, parser->states);
    (void)POP(parser, parser->marks);
    SEQUENCE_END_EVENT_INIT(*event, token->start_mark, token->end_mark);
    SKIP_TOKEN(parser);
    return 1;
}


