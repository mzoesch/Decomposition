// SCC: (yaml_emitter_set_unicode)

void yaml_emitter_set_unicode(Unknown *emitter, int unicode);


// Function: yaml_emitter_set_unicode
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0098Scc_yaml_emitter_set_unicode_yaml_emitter_set_unicode.fwd"
yaml_emitter_set_unicode(yaml_emitter_t *emitter, int unicode)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    emitter->unicode = (unicode != 0);
}


