// SCC: (yaml_file_write_handler)

int yaml_file_write_handler(Unknown *data, unsigned char *buffer, unsigned long size);


// Function: yaml_file_write_handler
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0091Scc_yaml_file_write_handler_yaml_file_write_handler.fwd"
yaml_file_write_handler(void *data, unsigned char *buffer, size_t size)
{
    yaml_emitter_t *emitter = (yaml_emitter_t *)data;

    return (fwrite(buffer, 1, size, emitter->output.file) == size);
}


