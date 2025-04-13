// SCC: (yaml_emitter_emit_mapping_start)

int yaml_emitter_process_anchor(Unknown *emitter);
int yaml_emitter_process_tag(Unknown *emitter);
int yaml_emitter_check_empty_mapping(Unknown *emitter);


int yaml_emitter_emit_mapping_start(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_mapping_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0156Scc_yaml_emitter_emit_mapping_start_yaml_emitter_emit_mapping_start.fwd"
yaml_emitter_emit_mapping_start(yaml_emitter_t *emitter, yaml_event_t *event)
{
    if (!yaml_emitter_process_anchor(emitter))
        return 0;
    if (!yaml_emitter_process_tag(emitter))
        return 0;

    if (emitter->flow_level || emitter->canonical
            || event->data.mapping_start.style == YAML_FLOW_MAPPING_STYLE
            || yaml_emitter_check_empty_mapping(emitter)) {
        emitter->state = YAML_EMIT_FLOW_MAPPING_FIRST_KEY_STATE;
    }
    else {
        emitter->state = YAML_EMIT_BLOCK_MAPPING_FIRST_KEY_STATE;
    }

    return 1;
}


