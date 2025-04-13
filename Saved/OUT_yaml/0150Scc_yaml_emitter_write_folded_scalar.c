// SCC: (yaml_emitter_write_folded_scalar)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_block_scalar_hints(Unknown *emitter, Unknown string);
int yaml_emitter_flush(Unknown *emitter);
int yaml_emitter_write_indent(Unknown *emitter);


int yaml_emitter_write_folded_scalar(Unknown *emitter, unsigned char *value, unsigned long length);


// Function: yaml_emitter_write_folded_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0150Scc_yaml_emitter_write_folded_scalar_yaml_emitter_write_folded_scalar.fwd"
yaml_emitter_write_folded_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length)
{
    yaml_string_t string;
    int breaks = 1;
    int leading_spaces = 1;

    STRING_ASSIGN(string, value, length);

    if (!yaml_emitter_write_indicator(emitter, ">", 1, 0, 0))
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
            if (!breaks && !leading_spaces && CHECK(string, '\n')) {
                int k = 0;
                while (IS_BREAK_AT(string, k)) {
                    k += WIDTH_AT(string, k);
                }
                if (!IS_BLANKZ_AT(string, k)) {
                    if (!PUT_BREAK(emitter)) return 0;
                }
            }
            if (!WRITE_BREAK(emitter, string)) return 0;
            emitter->indention = 1;
            breaks = 1;
        }
        else
        {
            if (breaks) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
                leading_spaces = IS_BLANK(string);
            }
            if (!breaks && IS_SPACE(string) && !IS_SPACE_AT(string, 1)
                    && emitter->column > emitter->best_width) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
                MOVE(string);
            }
            else {
                if (!WRITE(emitter, string)) return 0;
            }
            emitter->indention = 0;
            breaks = 0;
        }
    }

    return 1;
}


