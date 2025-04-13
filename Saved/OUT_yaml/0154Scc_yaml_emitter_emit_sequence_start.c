// SCC: (yaml_emitter_emit_sequence_start)

int yaml_emitter_process_anchor(Unknown *emitter);
int yaml_emitter_process_tag(Unknown *emitter);
int yaml_emitter_check_empty_sequence(Unknown *emitter);


int yaml_emitter_emit_sequence_start(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_sequence_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0154Scc_yaml_emitter_emit_sequence_start_yaml_emitter_emit_sequence_start.fwd"
yaml_emitter_emit_sequence_start(yaml_emitter_t *emitter, yaml_event_t *event)
{
    if (!yaml_emitter_process_anchor(emitter))
        return 0;
    if (!yaml_emitter_process_tag(emitter))
        return 0;

    if (emitter->flow_level || emitter->canonical
            || event->data.sequence_start.style == YAML_FLOW_SEQUENCE_STYLE
            || yaml_emitter_check_empty_sequence(emitter)) {
        emitter->state = YAML_EMIT_FLOW_SEQUENCE_FIRST_ITEM_STATE;
    }
    else {
        emitter->state = YAML_EMIT_BLOCK_SEQUENCE_FIRST_ITEM_STATE;
    }

    return 1;
}


