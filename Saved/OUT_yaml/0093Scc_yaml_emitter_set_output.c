// SCC: (yaml_emitter_set_output)

void yaml_emitter_set_output(Unknown *emitter, Unknown *handler, Unknown *data);


// Function: yaml_emitter_set_output
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0093Scc_yaml_emitter_set_output_yaml_emitter_set_output.fwd"
yaml_emitter_set_output(yaml_emitter_t *emitter,
        yaml_write_handler_t *handler, void *data)
{
    assert(emitter);    /* Non-NULL emitter object expected. */
    assert(!emitter->write_handler);    /* You can set the output only once. */
    assert(handler);    /* Non-NULL handler object expected. */

    emitter->write_handler = handler;
    emitter->write_handler_data = data;
}


