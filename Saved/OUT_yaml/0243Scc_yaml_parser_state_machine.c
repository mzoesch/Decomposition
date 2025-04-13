// SCC: (yaml_parser_state_machine)

int yaml_parser_parse_stream_start(Unknown *parser, Unknown *event);
int yaml_parser_parse_document_start(Unknown *parser, Unknown *event, int implicit);
int yaml_parser_parse_document_content(Unknown *parser, Unknown *event);
int yaml_parser_parse_document_end(Unknown *parser, Unknown *event);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);
int yaml_parser_parse_block_sequence_entry(Unknown *parser, Unknown *event, int first);
int yaml_parser_parse_indentless_sequence_entry(Unknown *parser, Unknown *event);
int yaml_parser_parse_block_mapping_key(Unknown *parser, Unknown *event, int first);
int yaml_parser_parse_block_mapping_value(Unknown *parser, Unknown *event);
int yaml_parser_parse_flow_sequence_entry(Unknown *parser, Unknown *event, int first);
int yaml_parser_parse_flow_sequence_entry_mapping_key(Unknown *parser, Unknown *event);
int yaml_parser_parse_flow_sequence_entry_mapping_value(Unknown *parser, Unknown *event);
int yaml_parser_parse_flow_sequence_entry_mapping_end(Unknown *parser, Unknown *event);
int yaml_parser_parse_flow_mapping_key(Unknown *parser, Unknown *event, int first);
int yaml_parser_parse_flow_mapping_value(Unknown *parser, Unknown *event, int empty);


int yaml_parser_state_machine(Unknown *parser, Unknown *event);


// Function: yaml_parser_state_machine
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0243Scc_yaml_parser_state_machine_yaml_parser_state_machine.fwd"
yaml_parser_state_machine(yaml_parser_t *parser, yaml_event_t *event)
{
    switch (parser->state)
    {
        case YAML_PARSE_STREAM_START_STATE:
            return yaml_parser_parse_stream_start(parser, event);

        case YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE:
            return yaml_parser_parse_document_start(parser, event, 1);

        case YAML_PARSE_DOCUMENT_START_STATE:
            return yaml_parser_parse_document_start(parser, event, 0);

        case YAML_PARSE_DOCUMENT_CONTENT_STATE:
            return yaml_parser_parse_document_content(parser, event);

        case YAML_PARSE_DOCUMENT_END_STATE:
            return yaml_parser_parse_document_end(parser, event);

        case YAML_PARSE_BLOCK_NODE_STATE:
            return yaml_parser_parse_node(parser, event, 1, 0);

        case YAML_PARSE_BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE:
            return yaml_parser_parse_node(parser, event, 1, 1);

        case YAML_PARSE_FLOW_NODE_STATE:
            return yaml_parser_parse_node(parser, event, 0, 0);

        case YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE:
            return yaml_parser_parse_block_sequence_entry(parser, event, 1);

        case YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE:
            return yaml_parser_parse_block_sequence_entry(parser, event, 0);

        case YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE:
            return yaml_parser_parse_indentless_sequence_entry(parser, event);

        case YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE:
            return yaml_parser_parse_block_mapping_key(parser, event, 1);

        case YAML_PARSE_BLOCK_MAPPING_KEY_STATE:
            return yaml_parser_parse_block_mapping_key(parser, event, 0);

        case YAML_PARSE_BLOCK_MAPPING_VALUE_STATE:
            return yaml_parser_parse_block_mapping_value(parser, event);

        case YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE:
            return yaml_parser_parse_flow_sequence_entry(parser, event, 1);

        case YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE:
            return yaml_parser_parse_flow_sequence_entry(parser, event, 0);

        case YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE:
            return yaml_parser_parse_flow_sequence_entry_mapping_key(parser, event);

        case YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE:
            return yaml_parser_parse_flow_sequence_entry_mapping_value(parser, event);

        case YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE:
            return yaml_parser_parse_flow_sequence_entry_mapping_end(parser, event);

        case YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE:
            return yaml_parser_parse_flow_mapping_key(parser, event, 1);

        case YAML_PARSE_FLOW_MAPPING_KEY_STATE:
            return yaml_parser_parse_flow_mapping_key(parser, event, 0);

        case YAML_PARSE_FLOW_MAPPING_VALUE_STATE:
            return yaml_parser_parse_flow_mapping_value(parser, event, 0);

        case YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE:
            return yaml_parser_parse_flow_mapping_value(parser, event, 1);

        default:
            assert(1);      /* Invalid state. */
    }

    return 0;
}


