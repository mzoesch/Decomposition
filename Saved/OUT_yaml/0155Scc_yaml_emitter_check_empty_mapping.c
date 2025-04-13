// SCC: (yaml_emitter_check_empty_mapping)

int yaml_emitter_check_empty_mapping(Unknown *emitter);


// Function: yaml_emitter_check_empty_mapping
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0155Scc_yaml_emitter_check_empty_mapping_yaml_emitter_check_empty_mapping.fwd"
yaml_emitter_check_empty_mapping(yaml_emitter_t *emitter)
{
    if (emitter->events.tail - emitter->events.head < 2)
        return 0;

    return (emitter->events.head[0].type == YAML_MAPPING_START_EVENT
            && emitter->events.head[1].type == YAML_MAPPING_END_EVENT);
}


