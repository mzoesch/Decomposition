// SCC: (yaml_emitter_process_tag)

int yaml_emitter_write_tag_handle(Unknown *emitter, unsigned char *value, unsigned long length);
int yaml_emitter_write_tag_content(Unknown *emitter, unsigned char *value, unsigned long length, int need_whitespace);
int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);


int yaml_emitter_process_tag(Unknown *emitter);


// Function: yaml_emitter_process_tag
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0143Scc_yaml_emitter_process_tag_yaml_emitter_process_tag.fwd"
yaml_emitter_process_tag(yaml_emitter_t *emitter)
{
    if (!emitter->tag_data.handle && !emitter->tag_data.suffix)
        return 1;

    if (emitter->tag_data.handle)
    {
        if (!yaml_emitter_write_tag_handle(emitter, emitter->tag_data.handle,
                    emitter->tag_data.handle_length))
            return 0;
        if (emitter->tag_data.suffix) {
            if (!yaml_emitter_write_tag_content(emitter, emitter->tag_data.suffix,
                        emitter->tag_data.suffix_length, 0))
                return 0;
        }
    }
    else
    {
        if (!yaml_emitter_write_indicator(emitter, "!<", 1, 0, 0))
            return 0;
        if (!yaml_emitter_write_tag_content(emitter, emitter->tag_data.suffix,
                    emitter->tag_data.suffix_length, 0))
            return 0;
        if (!yaml_emitter_write_indicator(emitter, ">", 0, 0, 0))
            return 0;
    }

    return 1;
}


