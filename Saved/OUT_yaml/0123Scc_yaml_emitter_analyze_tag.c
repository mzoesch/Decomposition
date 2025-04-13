// SCC: (yaml_emitter_analyze_tag)

int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_analyze_tag(Unknown *emitter, unsigned char *tag);


// Function: yaml_emitter_analyze_tag
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0123Scc_yaml_emitter_analyze_tag_yaml_emitter_analyze_tag.fwd"
yaml_emitter_analyze_tag(yaml_emitter_t *emitter,
        yaml_char_t *tag)
{
    size_t tag_length;
    yaml_string_t string;
    yaml_tag_directive_t *tag_directive;

    tag_length = strlen((char *)tag);
    STRING_ASSIGN(string, tag, tag_length);

    if (string.start == string.end) {
        return yaml_emitter_set_emitter_error(emitter,
                "tag value must not be empty");
    }

    for (tag_directive = emitter->tag_directives.start;
            tag_directive != emitter->tag_directives.top; tag_directive ++) {
        size_t prefix_length = strlen((char *)tag_directive->prefix);
        if (prefix_length < (size_t)(string.end - string.start)
                && strncmp((char *)tag_directive->prefix, (char *)string.start,
                    prefix_length) == 0)
        {
            emitter->tag_data.handle = tag_directive->handle;
            emitter->tag_data.handle_length =
                strlen((char *)tag_directive->handle);
            emitter->tag_data.suffix = string.start + prefix_length;
            emitter->tag_data.suffix_length =
                (string.end - string.start) - prefix_length;
            return 1;
        }
    }

    emitter->tag_data.suffix = string.start;
    emitter->tag_data.suffix_length = string.end - string.start;

    return 1;
}


