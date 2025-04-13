// SCC: (yaml_emitter_write_indent)

int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_indent(Unknown *emitter);


// Function: yaml_emitter_write_indent
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0134Scc_yaml_emitter_write_indent_yaml_emitter_write_indent.fwd"
yaml_emitter_write_indent(yaml_emitter_t *emitter)
{
    int indent = (emitter->indent >= 0) ? emitter->indent : 0;

    if (!emitter->indention || emitter->column > indent
            || (emitter->column == indent && !emitter->whitespace)) {
        if (!PUT_BREAK(emitter)) return 0;
    }

    while (emitter->column < indent) {
        if (!PUT(emitter, ' ')) return 0;
    }

    emitter->whitespace = 1;
    emitter->indention = 1;

    return 1;
}


