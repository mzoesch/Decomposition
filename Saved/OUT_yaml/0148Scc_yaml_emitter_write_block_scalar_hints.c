// SCC: (yaml_emitter_write_block_scalar_hints)

int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);


int yaml_emitter_write_block_scalar_hints(Unknown *emitter, Unknown string);


// Function: yaml_emitter_write_block_scalar_hints
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0148Scc_yaml_emitter_write_block_scalar_hints_yaml_emitter_write_block_scalar_hints.fwd"
yaml_emitter_write_block_scalar_hints(yaml_emitter_t *emitter,
        yaml_string_t string)
{
    char indent_hint[2];
    const char *chomp_hint = NULL;

    if (IS_SPACE(string) || IS_BREAK(string))
    {
        indent_hint[0] = '0' + (char)emitter->best_indent;
        indent_hint[1] = '\0';
        if (!yaml_emitter_write_indicator(emitter, indent_hint, 0, 0, 0))
            return 0;
    }

    emitter->open_ended = 0;

    string.pointer = string.end;
    if (string.start == string.pointer)
    {
        chomp_hint = "-";
    }
    else
    {
        do {
            string.pointer --;
        } while ((*string.pointer & 0xC0) == 0x80);
        if (!IS_BREAK(string))
        {
            chomp_hint = "-";
        }
        else if (string.start == string.pointer)
        {
            chomp_hint = "+";
            emitter->open_ended = 2;
        }
        else
        {
            do {
                string.pointer --;
            } while ((*string.pointer & 0xC0) == 0x80);
            if (IS_BREAK(string))
            {
                chomp_hint = "+";
                emitter->open_ended = 2;
            }
        }
    }

    if (chomp_hint)
    {
        if (!yaml_emitter_write_indicator(emitter, chomp_hint, 0, 0, 0))
            return 0;
    }

    return 1;
}


