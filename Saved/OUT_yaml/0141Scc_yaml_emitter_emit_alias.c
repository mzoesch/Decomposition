// SCC: (yaml_emitter_emit_alias)

int yaml_emitter_process_anchor(Unknown *emitter);
int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_emit_alias(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_alias
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0141Scc_yaml_emitter_emit_alias_yaml_emitter_emit_alias.fwd"
yaml_emitter_emit_alias(yaml_emitter_t *emitter, SHIM(yaml_event_t *event))
{
    if (!yaml_emitter_process_anchor(emitter))
        return 0;
    if (emitter->simple_key_context)
        if (!PUT(emitter, ' ')) return 0;
    emitter->state = POP(emitter, emitter->states);

    return 1;
}


