// SCC: (yaml_emitter_check_empty_sequence)

int yaml_emitter_check_empty_sequence(Unknown *emitter);


// Function: yaml_emitter_check_empty_sequence
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0153Scc_yaml_emitter_check_empty_sequence_yaml_emitter_check_empty_sequence.fwd"
yaml_emitter_check_empty_sequence(yaml_emitter_t *emitter)
{
    if (emitter->events.tail - emitter->events.head < 2)
        return 0;

    return (emitter->events.head[0].type == YAML_SEQUENCE_START_EVENT
            && emitter->events.head[1].type == YAML_SEQUENCE_END_EVENT);
}


