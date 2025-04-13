// SCC: (yaml_emitter_increase_indent)

int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_emitter_increase_indent(Unknown *emitter, int flow, int indentless);


// Function: yaml_emitter_increase_indent
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0144Scc_yaml_emitter_increase_indent_yaml_emitter_increase_indent.fwd"
yaml_emitter_increase_indent(yaml_emitter_t *emitter,
        int flow, int indentless)
{
    if (!PUSH(emitter, emitter->indents, emitter->indent))
        return 0;

    if (emitter->indent < 0) {
        emitter->indent = flow ? emitter->best_indent : 0;
    }
    else if (!indentless) {
        emitter->indent += emitter->best_indent;
    }

    return 1;
}


