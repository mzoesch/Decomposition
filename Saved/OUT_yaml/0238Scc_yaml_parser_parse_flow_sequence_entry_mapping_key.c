// SCC: (yaml_parser_parse_flow_sequence_entry_mapping_key)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);
int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);


int yaml_parser_parse_flow_sequence_entry_mapping_key(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_flow_sequence_entry_mapping_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0238Scc_yaml_parser_parse_flow_sequence_entry_mapping_key_yaml_parser_parse_flow_sequence_entry_mapping_key.fwd"
yaml_parser_parse_flow_sequence_entry_mapping_key(yaml_parser_t *parser,
        yaml_event_t *event)
{
    yaml_token_t *token;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type != YAML_VALUE_TOKEN && token->type != YAML_FLOW_ENTRY_TOKEN
            && token->type != YAML_FLOW_SEQUENCE_END_TOKEN) {
        if (!PUSH(parser, parser->states,
                    YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE))
            return 0;
        return yaml_parser_parse_node(parser, event, 0, 0);
    }
    else if (token->type == YAML_FLOW_SEQUENCE_END_TOKEN) {
        yaml_mark_t mark = token->start_mark;
        parser->state = YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE;
        return yaml_parser_process_empty_scalar(parser, event, mark);
    }
    else {
        yaml_mark_t mark = token->end_mark;
        SKIP_TOKEN(parser);
        parser->state = YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE;
        return yaml_parser_process_empty_scalar(parser, event, mark);
    }
}


