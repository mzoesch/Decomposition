// SCC: (yaml_emitter_write_tag_handle)

int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_tag_handle(Unknown *emitter, unsigned char *value, unsigned long length);


// Function: yaml_emitter_write_tag_handle
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0135Scc_yaml_emitter_write_tag_handle_yaml_emitter_write_tag_handle.fwd"
yaml_emitter_write_tag_handle(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length)
{
    yaml_string_t string;
    STRING_ASSIGN(string, value, length);

    if (!emitter->whitespace) {
        if (!PUT(emitter, ' ')) return 0;
    }

    while (string.pointer != string.end) {
        if (!WRITE(emitter, string)) return 0;
    }

    emitter->whitespace = 0;
    emitter->indention = 0;

    return 1;
}


