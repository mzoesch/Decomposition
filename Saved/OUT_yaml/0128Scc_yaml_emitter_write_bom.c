// SCC: (yaml_emitter_write_bom)

int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_bom(Unknown *emitter);


// Function: yaml_emitter_write_bom
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0128Scc_yaml_emitter_write_bom_yaml_emitter_write_bom.fwd"
yaml_emitter_write_bom(yaml_emitter_t *emitter)
{
    if (!FLUSH(emitter)) return 0;

    *(emitter->buffer.pointer++) = (yaml_char_t) '\xEF';
    *(emitter->buffer.pointer++) = (yaml_char_t) '\xBB';
    *(emitter->buffer.pointer++) = (yaml_char_t) '\xBF';

    return 1;
}


