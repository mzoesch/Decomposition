// SCC: (yaml_emitter_set_output_string)

void yaml_emitter_set_output_string(Unknown *emitter, unsigned char *output, unsigned long size, unsigned long *size_written);


// Function: yaml_emitter_set_output_string
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0090Scc_yaml_emitter_set_output_string_yaml_emitter_set_output_string.fwd"
yaml_emitter_set_output_string(yaml_emitter_t *emitter,
        unsigned char *output, size_t size, size_t *size_written)
{
    assert(emitter);    /* Non-NULL emitter object expected. */
    assert(!emitter->write_handler);    /* You can set the output only once. */
    assert(output);     /* Non-NULL output string expected. */

    emitter->write_handler = yaml_string_write_handler;
    emitter->write_handler_data = emitter;

    emitter->output.string.buffer = output;
    emitter->output.string.size = size;
    emitter->output.string.size_written = size_written;
    *size_written = 0;
}


