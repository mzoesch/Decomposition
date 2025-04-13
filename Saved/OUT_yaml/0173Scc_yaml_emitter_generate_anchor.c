// SCC: (yaml_emitter_generate_anchor)

void yaml_malloc(unsigned long size);


void yaml_emitter_generate_anchor(Unknown *emitter, int anchor_id);


// Function: yaml_emitter_generate_anchor
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0173Scc_yaml_emitter_generate_anchor_yaml_emitter_generate_anchor.fwd"
yaml_emitter_generate_anchor(SHIM(yaml_emitter_t *emitter), int anchor_id)
{
    yaml_char_t *anchor = YAML_MALLOC(ANCHOR_TEMPLATE_LENGTH);

    if (!anchor) return NULL;

    sprintf((char *)anchor, ANCHOR_TEMPLATE, anchor_id);

    return anchor;
}


