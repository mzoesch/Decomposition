// SCC: (yaml_emitter_set_canonical)

void yaml_emitter_set_canonical(Unknown *emitter, int canonical);


// Function: yaml_emitter_set_canonical
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0095Scc_yaml_emitter_set_canonical_yaml_emitter_set_canonical.fwd"
yaml_emitter_set_canonical(yaml_emitter_t *emitter, int canonical)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    emitter->canonical = (canonical != 0);
}


