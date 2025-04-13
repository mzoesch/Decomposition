// SCC: (yaml_emitter_process_anchor)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_anchor(Unknown *emitter, unsigned char *value, unsigned long length);


int yaml_emitter_process_anchor(Unknown *emitter);


// Function: yaml_emitter_process_anchor
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0140Scc_yaml_emitter_process_anchor_yaml_emitter_process_anchor.fwd"
yaml_emitter_process_anchor(yaml_emitter_t *emitter)
{
    if (!emitter->anchor_data.anchor)
        return 1;

    if (!yaml_emitter_write_indicator(emitter,
                (emitter->anchor_data.alias ? "*" : "&"), 1, 0, 0))
        return 0;

    return yaml_emitter_write_anchor(emitter,
            emitter->anchor_data.anchor, emitter->anchor_data.anchor_length);
}


