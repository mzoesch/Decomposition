// SCC: (yaml_parser_parse_flow_sequence_entry_mapping_value)

int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);
int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);


int yaml_parser_parse_flow_sequence_entry_mapping_value(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_flow_sequence_entry_mapping_value
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0239Scc_yaml_parser_parse_flow_sequence_entry_mapping_value_yaml_parser_parse_flow_sequence_entry_mapping_value.fwd"
yaml_parser_parse_flow_sequence_entry_mapping_value(yaml_parser_t *parser,
        yaml_event_t *event)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type == YAML_VALUE_TOKEN) {
        SKIP_TOKEN(parser);
        token = PEEK_TOKEN(parser);
        if (!token) return 0;
        if (token->type != YAML_FLOW_ENTRY_TOKEN
                && token->type != YAML_FLOW_SEQUENCE_END_TOKEN) {
            if (!PUSH(parser, parser->states,
                        YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE))
                return 0;
            return yaml_parser_parse_node(parser, event, 0, 0);
        }
    }
    parser->state = YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE;
    return yaml_parser_process_empty_scalar(parser, event, token->start_mark);
}


