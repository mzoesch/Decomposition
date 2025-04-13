// SCC: (yaml_emitter_emit_flow_mapping_value)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_indent(Unknown *emitter);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_emitter_emit_node(Unknown *emitter, Unknown *event, int root, int sequence, int mapping, int simple_key);


int yaml_emitter_emit_flow_mapping_value(Unknown *emitter, Unknown *event, int simple);


// Function: yaml_emitter_emit_flow_mapping_value
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0163Scc_yaml_emitter_emit_flow_mapping_value_yaml_emitter_emit_flow_mapping_value.fwd"
yaml_emitter_emit_flow_mapping_value(yaml_emitter_t *emitter,
        yaml_event_t *event, int simple)
{
    if (simple) {
        if (!yaml_emitter_write_indicator(emitter, ":", 0, 0, 0))
            return 0;
    }
    else {
        if (emitter->canonical || emitter->column > emitter->best_width) {
            if (!yaml_emitter_write_indent(emitter))
                return 0;
        }
        if (!yaml_emitter_write_indicator(emitter, ":", 1, 0, 0))
            return 0;
    }
    if (!PUSH(emitter, emitter->states, YAML_EMIT_FLOW_MAPPING_KEY_STATE))
        return 0;
    return yaml_emitter_emit_node(emitter, event, 0, 0, 1, 0);
}


