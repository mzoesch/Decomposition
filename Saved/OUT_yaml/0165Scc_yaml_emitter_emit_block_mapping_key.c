// SCC: (yaml_emitter_emit_block_mapping_key)

int yaml_emitter_increase_indent(Unknown *emitter, int flow, int indentless);
int yaml_emitter_write_indent(Unknown *emitter);
int yaml_emitter_check_simple_key(Unknown *emitter);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_emitter_emit_node(Unknown *emitter, Unknown *event, int root, int sequence, int mapping, int simple_key);
int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);


int yaml_emitter_emit_block_mapping_key(Unknown *emitter, Unknown *event, int first);


// Function: yaml_emitter_emit_block_mapping_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0165Scc_yaml_emitter_emit_block_mapping_key_yaml_emitter_emit_block_mapping_key.fwd"
yaml_emitter_emit_block_mapping_key(yaml_emitter_t *emitter,
        yaml_event_t *event, int first)
{
    if (first)
    {
        if (!yaml_emitter_increase_indent(emitter, 0, 0))
            return 0;
    }

    if (event->type == YAML_MAPPING_END_EVENT)
    {
        emitter->indent = POP(emitter, emitter->indents);
        emitter->state = POP(emitter, emitter->states);

        return 1;
    }

    if (!yaml_emitter_write_indent(emitter))
        return 0;

    if (yaml_emitter_check_simple_key(emitter))
    {
        if (!PUSH(emitter, emitter->states,
                    YAML_EMIT_BLOCK_MAPPING_SIMPLE_VALUE_STATE))
            return 0;

        return yaml_emitter_emit_node(emitter, event, 0, 0, 1, 1);
    }
    else
    {
        if (!yaml_emitter_write_indicator(emitter, "?", 1, 0, 1))
            return 0;
        if (!PUSH(emitter, emitter->states,
                    YAML_EMIT_BLOCK_MAPPING_VALUE_STATE))
            return 0;

        return yaml_emitter_emit_node(emitter, event, 0, 0, 1, 0);
    }
}


