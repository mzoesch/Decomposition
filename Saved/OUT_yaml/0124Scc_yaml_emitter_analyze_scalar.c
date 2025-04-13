// SCC: (yaml_emitter_analyze_scalar)

int yaml_emitter_analyze_scalar(Unknown *emitter, unsigned char *value, unsigned long length);


// Function: yaml_emitter_analyze_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0124Scc_yaml_emitter_analyze_scalar_yaml_emitter_analyze_scalar.fwd"
yaml_emitter_analyze_scalar(yaml_emitter_t *emitter,
        yaml_char_t *value, size_t length)
{
    yaml_string_t string;

    int block_indicators = 0;
    int flow_indicators = 0;
    int line_breaks = 0;
    int special_characters = 0;

    int leading_space = 0;
    int leading_break = 0;
    int trailing_space = 0;
    int trailing_break = 0;
    int break_space = 0;
    int space_break = 0;

    int preceded_by_whitespace = 0;
    int followed_by_whitespace = 0;
    int previous_space = 0;
    int previous_break = 0;

    STRING_ASSIGN(string, value, length);

    emitter->scalar_data.value = value;
    emitter->scalar_data.length = length;

    if (string.start == string.end)
    {
        emitter->scalar_data.multiline = 0;
        emitter->scalar_data.flow_plain_allowed = 0;
        emitter->scalar_data.block_plain_allowed = 1;
        emitter->scalar_data.single_quoted_allowed = 1;
        emitter->scalar_data.block_allowed = 0;

        return 1;
    }

    if ((CHECK_AT(string, '-', 0)
                && CHECK_AT(string, '-', 1)
                && CHECK_AT(string, '-', 2))
            || (CHECK_AT(string, '.', 0)
                && CHECK_AT(string, '.', 1)
                && CHECK_AT(string, '.', 2))) {
        block_indicators = 1;
        flow_indicators = 1;
    }

    preceded_by_whitespace = 1;
    followed_by_whitespace = IS_BLANKZ_AT(string, WIDTH(string));

    while (string.pointer != string.end)
    {
        if (string.start == string.pointer)
        {
            if (CHECK(string, '#') || CHECK(string, ',')
                    || CHECK(string, '[') || CHECK(string, ']')
                    || CHECK(string, '{') || CHECK(string, '}')
                    || CHECK(string, '&') || CHECK(string, '*')
                    || CHECK(string, '!') || CHECK(string, '|')
                    || CHECK(string, '>') || CHECK(string, '\'')
                    || CHECK(string, '"') || CHECK(string, '%')
                    || CHECK(string, '@') || CHECK(string, '`')) {
                flow_indicators = 1;
                block_indicators = 1;
            }

            if (CHECK(string, '?') || CHECK(string, ':')) {
                flow_indicators = 1;
                if (followed_by_whitespace) {
                    block_indicators = 1;
                }
            }

            if (CHECK(string, '-') && followed_by_whitespace) {
                flow_indicators = 1;
                block_indicators = 1;
            }
        }
        else
        {
            if (CHECK(string, ',') || CHECK(string, '?')
                    || CHECK(string, '[') || CHECK(string, ']')
                    || CHECK(string, '{') || CHECK(string, '}')) {
                flow_indicators = 1;
            }

            if (CHECK(string, ':')) {
                flow_indicators = 1;
                if (followed_by_whitespace) {
                    block_indicators = 1;
                }
            }

            if (CHECK(string, '#') && preceded_by_whitespace) {
                flow_indicators = 1;
                block_indicators = 1;
            }
        }

        if (!IS_PRINTABLE(string)
                || (!IS_ASCII(string) && !emitter->unicode)) {
            special_characters = 1;
        }

        if (IS_BREAK(string)) {
            line_breaks = 1;
        }

        if (IS_SPACE(string))
        {
            if (string.start == string.pointer) {
                leading_space = 1;
            }
            if (string.pointer+WIDTH(string) == string.end) {
                trailing_space = 1;
            }
            if (previous_break) {
                break_space = 1;
            }
            previous_space = 1;
            previous_break = 0;
        }
        else if (IS_BREAK(string))
        {
            if (string.start == string.pointer) {
                leading_break = 1;
            }
            if (string.pointer+WIDTH(string) == string.end) {
                trailing_break = 1;
            }
            if (previous_space) {
                space_break = 1;
            }
            previous_space = 0;
            previous_break = 1;
        }
        else
        {
            previous_space = 0;
            previous_break = 0;
        }

        preceded_by_whitespace = IS_BLANKZ(string);
        MOVE(string);
        if (string.pointer != string.end) {
            followed_by_whitespace = IS_BLANKZ_AT(string, WIDTH(string));
        }
    }

    emitter->scalar_data.multiline = line_breaks;

    emitter->scalar_data.flow_plain_allowed = 1;
    emitter->scalar_data.block_plain_allowed = 1;
    emitter->scalar_data.single_quoted_allowed = 1;
    emitter->scalar_data.block_allowed = 1;

    if (leading_space || leading_break || trailing_space || trailing_break) {
        emitter->scalar_data.flow_plain_allowed = 0;
        emitter->scalar_data.block_plain_allowed = 0;
    }

    if (trailing_space) {
        emitter->scalar_data.block_allowed = 0;
    }

    if (break_space) {
        emitter->scalar_data.flow_plain_allowed = 0;
        emitter->scalar_data.block_plain_allowed = 0;
        emitter->scalar_data.single_quoted_allowed = 0;
    }

    if (space_break || special_characters) {
        emitter->scalar_data.flow_plain_allowed = 0;
        emitter->scalar_data.block_plain_allowed = 0;
        emitter->scalar_data.single_quoted_allowed = 0;
        emitter->scalar_data.block_allowed = 0;
    }

    if (line_breaks) {
        emitter->scalar_data.flow_plain_allowed = 0;
        emitter->scalar_data.block_plain_allowed = 0;
    }

    if (flow_indicators) {
        emitter->scalar_data.flow_plain_allowed = 0;
    }

    if (block_indicators) {
        emitter->scalar_data.block_plain_allowed = 0;
    }

    return 1;
}


