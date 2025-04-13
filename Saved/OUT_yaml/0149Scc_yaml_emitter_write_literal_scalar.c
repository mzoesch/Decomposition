// SCC: (yaml_emitter_write_literal_scalar)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_block_scalar_hints(Unknown *emitter, Unknown string);
int yaml_emitter_flush(Unknown *emitter);
int yaml_emitter_write_indent(Unknown *emitter);


int yaml_emitter_write_literal_scalar(Unknown *emitter, unsigned char *value, unsigned long length);


// Function: yaml_emitter_write_literal_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0149Scc_yaml_emitter_write_literal_scalar_yaml_emitter_write_literal_scalar.fwd"
yaml_emitter_write_literal_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length)
{
    yaml_string_t string;
    int breaks = 1;

    STRING_ASSIGN(string, value, length);

    if (!yaml_emitter_write_indicator(emitter, "|", 1, 0, 0))
        return 0;
    if (!yaml_emitter_write_block_scalar_hints(emitter, string))
        return 0;
    if (!PUT_BREAK(emitter)) return 0;
    emitter->indention = 1;
    emitter->whitespace = 1;

    while (string.pointer != string.end)
    {
        if (IS_BREAK(string))
        {
            if (!WRITE_BREAK(emitter, string)) return 0;
            emitter->indention = 1;
            breaks = 1;
        }
        else
        {
            if (breaks) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
            }
            if (!WRITE(emitter, string)) return 0;
            emitter->indention = 0;
            breaks = 0;
        }
    }

    return 1;
}


