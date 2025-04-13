// SCC: (yaml_emitter_set_indent)

void yaml_emitter_set_indent(Unknown *emitter, int indent);


// Function: yaml_emitter_set_indent
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0096Scc_yaml_emitter_set_indent_yaml_emitter_set_indent.fwd"
yaml_emitter_set_indent(yaml_emitter_t *emitter, int indent)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    emitter->best_indent = (1 < indent && indent < 10) ? indent : 2;
}


