// SCC: (yaml_emitter_write_tag_content)

int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_tag_content(Unknown *emitter, unsigned char *value, unsigned long length, int need_whitespace);


// Function: yaml_emitter_write_tag_content
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0136Scc_yaml_emitter_write_tag_content_yaml_emitter_write_tag_content.fwd"
yaml_emitter_write_tag_content(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length,
        int need_whitespace)
{
    yaml_string_t string;
    STRING_ASSIGN(string, value, length);

    if (need_whitespace && !emitter->whitespace) {
        if (!PUT(emitter, ' ')) return 0;
    }

    while (string.pointer != string.end) {
        if (IS_ALPHA(string)
                || CHECK(string, ';') || CHECK(string, '/')
                || CHECK(string, '?') || CHECK(string, ':')
                || CHECK(string, '@') || CHECK(string, '&')
                || CHECK(string, '=') || CHECK(string, '+')
                || CHECK(string, '$') || CHECK(string, ',')
                || CHECK(string, '_') || CHECK(string, '.')
                || CHECK(string, '~') || CHECK(string, '*')
                || CHECK(string, '\'') || CHECK(string, '(')
                || CHECK(string, ')') || CHECK(string, '[')
                || CHECK(string, ']')) {
            if (!WRITE(emitter, string)) return 0;
        }
        else {
            int width = WIDTH(string);
            unsigned int value;
            while (width --) {
                value = *(string.pointer++);
                if (!PUT(emitter, '%')) return 0;
                if (!PUT(emitter, (value >> 4)
                            + ((value >> 4) < 10 ? '0' : 'A' - 10)))
                    return 0;
                if (!PUT(emitter, (value & 0x0F)
                            + ((value & 0x0F) < 10 ? '0' : 'A' - 10)))
                    return 0;
            }
        }
    }

    emitter->whitespace = 0;
    emitter->indention = 0;

    return 1;
}


