// SCC: (yaml_parser_parse_flow_sequence_entry_mapping_end)

int yaml_parser_fetch_more_tokens(Unknown *parser);


int yaml_parser_parse_flow_sequence_entry_mapping_end(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_flow_sequence_entry_mapping_end
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0240Scc_yaml_parser_parse_flow_sequence_entry_mapping_end_yaml_parser_parse_flow_sequence_entry_mapping_end.fwd"
yaml_parser_parse_flow_sequence_entry_mapping_end(yaml_parser_t *parser,
        yaml_event_t *event)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    parser->state = YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE;

    MAPPING_END_EVENT_INIT(*event, token->start_mark, token->start_mark);
    return 1;
}


