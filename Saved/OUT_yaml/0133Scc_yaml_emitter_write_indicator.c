// SCC: (yaml_emitter_write_indicator)

int yaml_emitter_flush(Unknown *emitter);


int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);


// Function: yaml_emitter_write_indicator
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0133Scc_yaml_emitter_write_indicator_yaml_emitter_write_indicator.fwd"
yaml_emitter_write_indicator(yaml_emitter_t *emitter,
        const char *indicator, int need_whitespace,
        int is_whitespace, int is_indention)
{
    size_t indicator_length;
    yaml_string_t string;

    indicator_length = strlen(indicator);
    STRING_ASSIGN(string, (yaml_char_t *)indicator, indicator_length);

    if (need_whitespace && !emitter->whitespace) {
        if (!PUT(emitter, ' ')) return 0;
    }

    while (string.pointer != string.end) {
        if (!WRITE(emitter, string)) return 0;
    }

    emitter->whitespace = is_whitespace;
    emitter->indention = (emitter->indention && is_indention);

    return 1;
}


