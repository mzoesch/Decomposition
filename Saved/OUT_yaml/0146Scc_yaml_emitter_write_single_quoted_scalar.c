// SCC: (yaml_emitter_write_single_quoted_scalar)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_indent(Unknown *emitter);
int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_single_quoted_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);


// Function: yaml_emitter_write_single_quoted_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0146Scc_yaml_emitter_write_single_quoted_scalar_yaml_emitter_write_single_quoted_scalar.fwd"
yaml_emitter_write_single_quoted_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length, int allow_breaks)
{
    yaml_string_t string;
    int spaces = 0;
    int breaks = 0;

    STRING_ASSIGN(string, value, length);

    if (!yaml_emitter_write_indicator(emitter, "'", 1, 0, 0))
        return 0;

    while (string.pointer != string.end)
    {
        if (IS_SPACE(string))
        {
            if (allow_breaks && !spaces
                    && emitter->column > emitter->best_width
                    && string.pointer != string.start
                    && string.pointer != string.end - 1
                    && !IS_SPACE_AT(string, 1)) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
                MOVE(string);
            }
            else {
                if (!WRITE(emitter, string)) return 0;
            }
            spaces = 1;
        }
        else if (IS_BREAK(string))
        {
            if (!breaks && CHECK(string, '\n')) {
                if (!PUT_BREAK(emitter)) return 0;
            }
            if (!WRITE_BREAK(emitter, string)) return 0;
            emitter->indention = 1;
            breaks = 1;
        }
        else
        {
            if (breaks) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
            }
            if (CHECK(string, '\'')) {
                if (!PUT(emitter, '\'')) return 0;
            }
            if (!WRITE(emitter, string)) return 0;
            emitter->indention = 0;
            spaces = 0;
            breaks = 0;
        }
    }

    if (breaks)
        if (!yaml_emitter_write_indent(emitter)) return 0;

    if (!yaml_emitter_write_indicator(emitter, "'", 0, 0, 0))
        return 0;

    emitter->whitespace = 0;
    emitter->indention = 0;

    return 1;
}


