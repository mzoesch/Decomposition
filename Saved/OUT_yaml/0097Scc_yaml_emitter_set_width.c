// SCC: (yaml_emitter_set_width)

void yaml_emitter_set_width(Unknown *emitter, int width);


// Function: yaml_emitter_set_width
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0097Scc_yaml_emitter_set_width_yaml_emitter_set_width.fwd"
yaml_emitter_set_width(yaml_emitter_t *emitter, int width)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    emitter->best_width = (width >= 0) ? width : -1;
}


