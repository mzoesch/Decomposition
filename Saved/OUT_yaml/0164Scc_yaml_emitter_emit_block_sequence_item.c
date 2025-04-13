// SCC: (yaml_emitter_emit_block_sequence_item)

int yaml_emitter_increase_indent(Unknown *emitter, int flow, int indentless);
int yaml_emitter_write_indent(Unknown *emitter);
int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_emitter_emit_node(Unknown *emitter, Unknown *event, int root, int sequence, int mapping, int simple_key);


int yaml_emitter_emit_block_sequence_item(Unknown *emitter, Unknown *event, int first);


// Function: yaml_emitter_emit_block_sequence_item
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0164Scc_yaml_emitter_emit_block_sequence_item_yaml_emitter_emit_block_sequence_item.fwd"
yaml_emitter_emit_block_sequence_item(yaml_emitter_t *emitter,
        yaml_event_t *event, int first)
{
    if (first)
    {
        if (!yaml_emitter_increase_indent(emitter, 0,
                    (emitter->mapping_context && !emitter->indention)))
            return 0;
    }

    if (event->type == YAML_SEQUENCE_END_EVENT)
    {
        emitter->indent = POP(emitter, emitter->indents);
        emitter->state = POP(emitter, emitter->states);

        return 1;
    }

    if (!yaml_emitter_write_indent(emitter))
        return 0;
    if (!yaml_emitter_write_indicator(emitter, "-", 1, 0, 1))
        return 0;
    if (!PUSH(emitter, emitter->states,
                YAML_EMIT_BLOCK_SEQUENCE_ITEM_STATE))
        return 0;

    return yaml_emitter_emit_node(emitter, event, 0, 1, 0, 0);
}


