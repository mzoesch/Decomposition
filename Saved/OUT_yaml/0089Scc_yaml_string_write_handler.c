// SCC: (yaml_string_write_handler)

int yaml_string_write_handler(Unknown *data, unsigned char *buffer, unsigned long size);


// Function: yaml_string_write_handler
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0089Scc_yaml_string_write_handler_yaml_string_write_handler.fwd"
yaml_string_write_handler(void *data, unsigned char *buffer, size_t size)
{
  yaml_emitter_t *emitter = (yaml_emitter_t *)data;

    if (emitter->output.string.size - *emitter->output.string.size_written
            < size) {
        memcpy(emitter->output.string.buffer
                + *emitter->output.string.size_written,
                buffer,
                emitter->output.string.size
                - *emitter->output.string.size_written);
        *emitter->output.string.size_written = emitter->output.string.size;
        return 0;
    }

    memcpy(emitter->output.string.buffer
            + *emitter->output.string.size_written, buffer, size);
    *emitter->output.string.size_written += size;
    return 1;
}


