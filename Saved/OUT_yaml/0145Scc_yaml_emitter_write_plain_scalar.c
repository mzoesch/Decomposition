// SCC: (yaml_emitter_write_plain_scalar)

int yaml_emitter_flush(Unknown *emitter);
int yaml_emitter_write_indent(Unknown *emitter);


int yaml_emitter_write_plain_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);


// Function: yaml_emitter_write_plain_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0145Scc_yaml_emitter_write_plain_scalar_yaml_emitter_write_plain_scalar.fwd"
yaml_emitter_write_plain_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length, int allow_breaks)
{
    yaml_string_t string;
    int spaces = 0;
    int breaks = 0;

    STRING_ASSIGN(string, value, length);

    /**
     * Avoid trailing spaces for empty values in block mode.
     * In flow mode, we still want the space to prevent ambiguous things
     * like {a:}.
     * Currently, the emitter forbids any plain empty scalar in flow mode
     * (e.g. it outputs {a: ''} instead), so emitter->flow_level will
     * never be true here.
     * But if the emitter is ever changed to allow emitting empty values,
     * the check for flow_level is already here.
     */
    if (!emitter->whitespace && (length || emitter->flow_level)) {
        if (!PUT(emitter, ' ')) return 0;
    }

    while (string.pointer != string.end)
    {
        if (IS_SPACE(string))
        {
            if (allow_breaks && !spaces
                    && emitter->column > emitter->best_width
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
            if (!WRITE(emitter, string)) return 0;
            emitter->indention = 0;
            spaces = 0;
            breaks = 0;
        }
    }

    emitter->whitespace = 0;
    emitter->indention = 0;

    return 1;
}


