// SCC: (yaml_emitter_set_encoding)

void yaml_emitter_set_encoding(Unknown *emitter, Unknown encoding);


// Function: yaml_emitter_set_encoding
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0094Scc_yaml_emitter_set_encoding_yaml_emitter_set_encoding.fwd"
yaml_emitter_set_encoding(yaml_emitter_t *emitter, yaml_encoding_t encoding)
{
    assert(emitter);    /* Non-NULL emitter object expected. */
    assert(!emitter->encoding);     /* You can set encoding only once. */

    emitter->encoding = encoding;
}


