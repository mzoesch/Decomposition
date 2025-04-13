// SCC: (yaml_emitter_emit_document_content)

int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_emitter_emit_node(Unknown *emitter, Unknown *event, int root, int sequence, int mapping, int simple_key);


int yaml_emitter_emit_document_content(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_document_content
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0158Scc_yaml_emitter_emit_document_content_yaml_emitter_emit_document_content.fwd"
yaml_emitter_emit_document_content(yaml_emitter_t *emitter,
        yaml_event_t *event)
{
    if (!PUSH(emitter, emitter->states, YAML_EMIT_DOCUMENT_END_STATE))
        return 0;

    return yaml_emitter_emit_node(emitter, event, 1, 0, 0, 0);
}


