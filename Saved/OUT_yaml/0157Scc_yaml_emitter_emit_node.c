// SCC: (yaml_emitter_emit_node)

int yaml_emitter_emit_alias(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_scalar(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_sequence_start(Unknown *emitter, Unknown *event);
int yaml_emitter_emit_mapping_start(Unknown *emitter, Unknown *event);
int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_emit_node(Unknown *emitter, Unknown *event, int root, int sequence, int mapping, int simple_key);


// Function: yaml_emitter_emit_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0157Scc_yaml_emitter_emit_node_yaml_emitter_emit_node.fwd"
yaml_emitter_emit_node(yaml_emitter_t *emitter, yaml_event_t *event,
        int root, int sequence, int mapping, int simple_key)
{
    emitter->root_context = root;
    emitter->sequence_context = sequence;
    emitter->mapping_context = mapping;
    emitter->simple_key_context = simple_key;

    switch (event->type)
    {
        case YAML_ALIAS_EVENT:
            return yaml_emitter_emit_alias(emitter, event);

        case YAML_SCALAR_EVENT:
            return yaml_emitter_emit_scalar(emitter, event);

        case YAML_SEQUENCE_START_EVENT:
            return yaml_emitter_emit_sequence_start(emitter, event);

        case YAML_MAPPING_START_EVENT:
            return yaml_emitter_emit_mapping_start(emitter, event);

        default:
            return yaml_emitter_set_emitter_error(emitter,
                    "expected SCALAR, SEQUENCE-START, MAPPING-START, or ALIAS");
    }

    return 0;
}


