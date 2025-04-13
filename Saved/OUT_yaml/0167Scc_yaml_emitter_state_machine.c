// SCC: (yaml_emitter_state_machine)

int yaml_emitter_emit_stream_start(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_document_start(Unknown *emitter, Unknown *event, int first);
int yaml_emitter_emit_document_content(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_document_end(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_flow_sequence_item(Unknown *emitter, Unknown *event, int first);
int yaml_emitter_emit_flow_mapping_key(Unknown *emitter, Unknown *event, int first);
int yaml_emitter_emit_flow_mapping_value(Unknown *emitter, Unknown *event, int simple);
int yaml_emitter_emit_block_sequence_item(Unknown *emitter, Unknown *event, int first);
int yaml_emitter_emit_block_mapping_key(Unknown *emitter, Unknown *event, int first);
int yaml_emitter_emit_block_mapping_value(Unknown *emitter, Unknown *event, int simple);
int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_state_machine(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_state_machine
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0167Scc_yaml_emitter_state_machine_yaml_emitter_state_machine.fwd"
yaml_emitter_state_machine(yaml_emitter_t *emitter, yaml_event_t *event)
{
    switch (emitter->state)
    {
        case YAML_EMIT_STREAM_START_STATE:
            return yaml_emitter_emit_stream_start(emitter, event);

        case YAML_EMIT_FIRST_DOCUMENT_START_STATE:
            return yaml_emitter_emit_document_start(emitter, event, 1);

        case YAML_EMIT_DOCUMENT_START_STATE:
            return yaml_emitter_emit_document_start(emitter, event, 0);

        case YAML_EMIT_DOCUMENT_CONTENT_STATE:
            return yaml_emitter_emit_document_content(emitter, event);

        case YAML_EMIT_DOCUMENT_END_STATE:
            return yaml_emitter_emit_document_end(emitter, event);

        case YAML_EMIT_FLOW_SEQUENCE_FIRST_ITEM_STATE:
            return yaml_emitter_emit_flow_sequence_item(emitter, event, 1);

        case YAML_EMIT_FLOW_SEQUENCE_ITEM_STATE:
            return yaml_emitter_emit_flow_sequence_item(emitter, event, 0);

        case YAML_EMIT_FLOW_MAPPING_FIRST_KEY_STATE:
            return yaml_emitter_emit_flow_mapping_key(emitter, event, 1);

        case YAML_EMIT_FLOW_MAPPING_KEY_STATE:
            return yaml_emitter_emit_flow_mapping_key(emitter, event, 0);

        case YAML_EMIT_FLOW_MAPPING_SIMPLE_VALUE_STATE:
            return yaml_emitter_emit_flow_mapping_value(emitter, event, 1);

        case YAML_EMIT_FLOW_MAPPING_VALUE_STATE:
            return yaml_emitter_emit_flow_mapping_value(emitter, event, 0);

        case YAML_EMIT_BLOCK_SEQUENCE_FIRST_ITEM_STATE:
            return yaml_emitter_emit_block_sequence_item(emitter, event, 1);

        case YAML_EMIT_BLOCK_SEQUENCE_ITEM_STATE:
            return yaml_emitter_emit_block_sequence_item(emitter, event, 0);

        case YAML_EMIT_BLOCK_MAPPING_FIRST_KEY_STATE:
            return yaml_emitter_emit_block_mapping_key(emitter, event, 1);

        case YAML_EMIT_BLOCK_MAPPING_KEY_STATE:
            return yaml_emitter_emit_block_mapping_key(emitter, event, 0);

        case YAML_EMIT_BLOCK_MAPPING_SIMPLE_VALUE_STATE:
            return yaml_emitter_emit_block_mapping_value(emitter, event, 1);

        case YAML_EMIT_BLOCK_MAPPING_VALUE_STATE:
            return yaml_emitter_emit_block_mapping_value(emitter, event, 0);

        case YAML_EMIT_END_STATE:
            return yaml_emitter_set_emitter_error(emitter,
                    "expected nothing after STREAM-END");

        default:
            assert(1);      /* Invalid state. */
    }

    return 0;
}


