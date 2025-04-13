// SCC: (yaml_parser_parse_flow_mapping_key)

int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_set_parser_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);
int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);


int yaml_parser_parse_flow_mapping_key(Unknown *parser, Unknown *event, int first);


// Function: yaml_parser_parse_flow_mapping_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0241Scc_yaml_parser_parse_flow_mapping_key_yaml_parser_parse_flow_mapping_key.fwd"
yaml_parser_parse_flow_mapping_key(yaml_parser_t *parser,
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

    if (token->type != YAML_FLOW_MAPPING_END_TOKEN)
    {
        if (!first) {
            if (token->type == YAML_FLOW_ENTRY_TOKEN) {
                SKIP_TOKEN(parser);
                token = PEEK_TOKEN(parser);
                if (!token) return 0;
            }
            else {
                return yaml_parser_set_parser_error_context(parser,
                        "while parsing a flow mapping", POP(parser, parser->marks),
                        "did not find expected ',' or '}'", token->start_mark);
            }
        }

        if (token->type == YAML_KEY_TOKEN) {
            SKIP_TOKEN(parser);
            token = PEEK_TOKEN(parser);
            if (!token) return 0;
            if (token->type != YAML_VALUE_TOKEN
                    && token->type != YAML_FLOW_ENTRY_TOKEN
                    && token->type != YAML_FLOW_MAPPING_END_TOKEN) {
                if (!PUSH(parser, parser->states,
                            YAML_PARSE_FLOW_MAPPING_VALUE_STATE))
                    return 0;
                return yaml_parser_parse_node(parser, event, 0, 0);
            }
            else {
                parser->state = YAML_PARSE_FLOW_MAPPING_VALUE_STATE;
                return yaml_parser_process_empty_scalar(parser, event,
                        token->start_mark);
            }
        }
        else if (token->type != YAML_FLOW_MAPPING_END_TOKEN) {
            if (!PUSH(parser, parser->states,
                        YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE))
                return 0;
            return yaml_parser_parse_node(parser, event, 0, 0);
        }
    }

    parser->state = POP(parser, parser->states);
    (void)POP(parser, parser->marks);
    MAPPING_END_EVENT_INIT(*event, token->start_mark, token->end_mark);
    SKIP_TOKEN(parser);
    return 1;
}

/*
 * Parse the productions:
 * flow_mapping_entry   ::= flow_node | KEY flow_node? (VALUE flow_node?)?
 *                                   *                  ***** *
 */

static int
yaml_parser_parse_flow_mapping_value(yaml_parser_t *parser,
        yaml_event_t *event, int empty)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (empty) {
        parser->state = YAML_PARSE_FLOW_MAPPING_KEY_STATE;
        return yaml_parser_process_empty_scalar(parser, event,
                token->start_mark);
    }


