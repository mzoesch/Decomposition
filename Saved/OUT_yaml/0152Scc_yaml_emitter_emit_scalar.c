// SCC: (yaml_emitter_emit_scalar)

int yaml_emitter_select_scalar_style(Unknown *emitter, Unknown *event);
int yaml_emitter_process_anchor(Unknown *emitter);
int yaml_emitter_process_tag(Unknown *emitter);
int yaml_emitter_increase_indent(Unknown *emitter, int flow, int indentless);
int yaml_emitter_process_scalar(Unknown *emitter);


int yaml_emitter_emit_scalar(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0152Scc_yaml_emitter_emit_scalar_yaml_emitter_emit_scalar.fwd"
yaml_emitter_emit_scalar(yaml_emitter_t *emitter, yaml_event_t *event)
{
    if (!yaml_emitter_select_scalar_style(emitter, event))
        return 0;
    if (!yaml_emitter_process_anchor(emitter))
        return 0;
    if (!yaml_emitter_process_tag(emitter))
        return 0;
    if (!yaml_emitter_increase_indent(emitter, 1, 0))
        return 0;
    if (!yaml_emitter_process_scalar(emitter))
        return 0;
    emitter->indent = POP(emitter, emitter->indents);
    emitter->state = POP(emitter, emitter->states);

    return 1;
}


