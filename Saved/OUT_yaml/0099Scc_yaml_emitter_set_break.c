// SCC: (yaml_emitter_set_break)

void yaml_emitter_set_break(Unknown *emitter, Unknown line_break);


// Function: yaml_emitter_set_break
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0099Scc_yaml_emitter_set_break_yaml_emitter_set_break.fwd"
yaml_emitter_set_break(yaml_emitter_t *emitter, yaml_break_t line_break)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    emitter->line_break = line_break;
}


