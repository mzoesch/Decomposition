// SCC: (yaml_emitter_check_simple_key)

int yaml_emitter_check_empty_sequence(Unknown *emitter);
int yaml_emitter_check_empty_mapping(Unknown *emitter);


int yaml_emitter_check_simple_key(Unknown *emitter);


// Function: yaml_emitter_check_simple_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0161Scc_yaml_emitter_check_simple_key_yaml_emitter_check_simple_key.fwd"
yaml_emitter_check_simple_key(yaml_emitter_t *emitter)
{
    yaml_event_t *event = emitter->events.head;
    size_t length = 0;

    switch (event->type)
    {
        case YAML_ALIAS_EVENT:
            length += emitter->anchor_data.anchor_length;
            break;

        case YAML_SCALAR_EVENT:
            if (emitter->scalar_data.multiline)
                return 0;
            length += emitter->anchor_data.anchor_length
                + emitter->tag_data.handle_length
                + emitter->tag_data.suffix_length
                + emitter->scalar_data.length;
            break;

        case YAML_SEQUENCE_START_EVENT:
            if (!yaml_emitter_check_empty_sequence(emitter))
                return 0;
            length += emitter->anchor_data.anchor_length
                + emitter->tag_data.handle_length
                + emitter->tag_data.suffix_length;
            break;

        case YAML_MAPPING_START_EVENT:
            if (!yaml_emitter_check_empty_mapping(emitter))
                return 0;
            length += emitter->anchor_data.anchor_length
                + emitter->tag_data.handle_length
                + emitter->tag_data.suffix_length;
            break;

        default:
            return 0;
    }

    if (length > 128)
        return 0;

    return 1;
}


