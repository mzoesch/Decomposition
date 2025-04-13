// SCC: (yaml_emitter_write_double_quoted_scalar)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_flush(Unknown *emitter);
int yaml_emitter_write_indent(Unknown *emitter);


int yaml_emitter_write_double_quoted_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);


// Function: yaml_emitter_write_double_quoted_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0147Scc_yaml_emitter_write_double_quoted_scalar_yaml_emitter_write_double_quoted_scalar.fwd"
yaml_emitter_write_double_quoted_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length, int allow_breaks)
{
    yaml_string_t string;
    int spaces = 0;

    STRING_ASSIGN(string, value, length);

    if (!yaml_emitter_write_indicator(emitter, "\"", 1, 0, 0))
        return 0;

    while (string.pointer != string.end)
    {
        if (!IS_PRINTABLE(string) || (!emitter->unicode && !IS_ASCII(string))
                || IS_BOM(string) || IS_BREAK(string)
                || CHECK(string, '"') || CHECK(string, '\\'))
        {
            unsigned char octet;
            unsigned int width;
            unsigned int value;
            int k;

            octet = string.pointer[0];
            width = (octet & 0x80) == 0x00 ? 1 :
                    (octet & 0xE0) == 0xC0 ? 2 :
                    (octet & 0xF0) == 0xE0 ? 3 :
                    (octet & 0xF8) == 0xF0 ? 4 : 0;
            value = (octet & 0x80) == 0x00 ? octet & 0x7F :
                    (octet & 0xE0) == 0xC0 ? octet & 0x1F :
                    (octet & 0xF0) == 0xE0 ? octet & 0x0F :
                    (octet & 0xF8) == 0xF0 ? octet & 0x07 : 0;
            for (k = 1; k < (int)width; k ++) {
                octet = string.pointer[k];
                value = (value << 6) + (octet & 0x3F);
            }
            string.pointer += width;

            if (!PUT(emitter, '\\')) return 0;

            switch (value)
            {
                case 0x00:
                    if (!PUT(emitter, '0')) return 0;
                    break;

                case 0x07:
                    if (!PUT(emitter, 'a')) return 0;
                    break;

                case 0x08:
                    if (!PUT(emitter, 'b')) return 0;
                    break;

                case 0x09:
                    if (!PUT(emitter, 't')) return 0;
                    break;

                case 0x0A:
                    if (!PUT(emitter, 'n')) return 0;
                    break;

                case 0x0B:
                    if (!PUT(emitter, 'v')) return 0;
                    break;

                case 0x0C:
                    if (!PUT(emitter, 'f')) return 0;
                    break;

                case 0x0D:
                    if (!PUT(emitter, 'r')) return 0;
                    break;

                case 0x1B:
                    if (!PUT(emitter, 'e')) return 0;
                    break;

                case 0x22:
                    if (!PUT(emitter, '\"')) return 0;
                    break;

                case 0x5C:
                    if (!PUT(emitter, '\\')) return 0;
                    break;

                case 0x85:
                    if (!PUT(emitter, 'N')) return 0;
                    break;

                case 0xA0:
                    if (!PUT(emitter, '_')) return 0;
                    break;

                case 0x2028:
                    if (!PUT(emitter, 'L')) return 0;
                    break;

                case 0x2029:
                    if (!PUT(emitter, 'P')) return 0;
                    break;

                default:
                    if (value <= 0xFF) {
                        if (!PUT(emitter, 'x')) return 0;
                        width = 2;
                    }
                    else if (value <= 0xFFFF) {
                        if (!PUT(emitter, 'u')) return 0;
                        width = 4;
                    }
                    else {
                        if (!PUT(emitter, 'U')) return 0;
                        width = 8;
                    }
                    for (k = (width-1)*4; k >= 0; k -= 4) {
                        int digit = (value >> k) & 0x0F;
                        if (!PUT(emitter, digit + (digit < 10 ? '0' : 'A'-10)))
                            return 0;
                    }
            }
            spaces = 0;
        }
        else if (IS_SPACE(string))
        {
            if (allow_breaks && !spaces
                    && emitter->column > emitter->best_width
                    && string.pointer != string.start
                    && string.pointer != string.end - 1) {
                if (!yaml_emitter_write_indent(emitter)) return 0;
                if (IS_SPACE_AT(string, 1)) {
                    if (!PUT(emitter, '\\')) return 0;
                }
                MOVE(string);
            }
            else {
                if (!WRITE(emitter, string)) return 0;
            }
            spaces = 1;
        }
        else
        {
            if (!WRITE(emitter, string)) return 0;
            spaces = 0;
        }
    }

    if (!yaml_emitter_write_indicator(emitter, "\"", 0, 0, 0))
        return 0;

    emitter->whitespace = 0;
    emitter->indention = 0;

    return 1;
}


