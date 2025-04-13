// SCC: (yaml_emitter_append_tag_directive)

#include "0000StructType_struct.yaml_tag_directive_s.h"


int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);
void yaml_strdup(const unsigned char *str);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_emitter_append_tag_directive(Unknown *emitter, Unknown value, int allow_duplicates);


// Function: yaml_emitter_append_tag_directive
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0132Scc_yaml_emitter_append_tag_directive_yaml_emitter_append_tag_directive.fwd"
yaml_emitter_append_tag_directive(yaml_emitter_t *emitter,
        yaml_tag_directive_t value, int allow_duplicates)
{
    yaml_tag_directive_t *tag_directive;
    yaml_tag_directive_t copy = { NULL, NULL };

    for (tag_directive = emitter->tag_directives.start;
            tag_directive != emitter->tag_directives.top; tag_directive ++) {
        if (strcmp((char *)value.handle, (char *)tag_directive->handle) == 0) {
            if (allow_duplicates)
                return 1;
            return yaml_emitter_set_emitter_error(emitter,
                    "duplicate %TAG directive");
        }
    }

    copy.handle = yaml_strdup(value.handle);
    copy.prefix = yaml_strdup(value.prefix);
    if (!copy.handle || !copy.prefix) {
        emitter->error = YAML_MEMORY_ERROR;
        goto error;
    }

    if (!PUSH(emitter, emitter->tag_directives, copy))
        goto error;

    return 1;

error:
    yaml_free(copy.handle);
    yaml_free(copy.prefix);
    return 0;
}


