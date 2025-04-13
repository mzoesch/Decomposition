// SCC: (yaml_emitter_set_output_file)

void yaml_emitter_set_output_file(Unknown *emitter, Unknown *file);


// Function: yaml_emitter_set_output_file
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0092Scc_yaml_emitter_set_output_file_yaml_emitter_set_output_file.fwd"
yaml_emitter_set_output_file(yaml_emitter_t *emitter, FILE *file)
{
    assert(emitter);    /* Non-NULL emitter object expected. */
    assert(!emitter->write_handler);    /* You can set the output only once. */
    assert(file);       /* Non-NULL file object expected. */

    emitter->write_handler = yaml_file_write_handler;
    emitter->write_handler_data = emitter;

    emitter->output.file = file;
}


