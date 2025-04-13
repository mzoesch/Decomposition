// SCC: (yaml_emitter_analyze_tag_directive)

#include "0000StructType_struct.yaml_tag_directive_s.h"


int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_analyze_tag_directive(Unknown *emitter, Unknown tag_directive);


// Function: yaml_emitter_analyze_tag_directive
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0131Scc_yaml_emitter_analyze_tag_directive_yaml_emitter_analyze_tag_directive.fwd"
yaml_emitter_analyze_tag_directive(yaml_emitter_t *emitter,
        yaml_tag_directive_t tag_directive)
{
    yaml_string_t handle;
    yaml_string_t prefix;
    size_t handle_length;
    size_t prefix_length;

    handle_length = strlen((char *)tag_directive.handle);
    prefix_length = strlen((char *)tag_directive.prefix);
    STRING_ASSIGN(handle, tag_directive.handle, handle_length);
    STRING_ASSIGN(prefix, tag_directive.prefix, prefix_length);

    if (handle.start == handle.end) {
        return yaml_emitter_set_emitter_error(emitter,
                "tag handle must not be empty");
    }

    if (handle.start[0] != '!') {
        return yaml_emitter_set_emitter_error(emitter,
                "tag handle must start with '!'");
    }

    if (handle.end[-1] != '!') {
        return yaml_emitter_set_emitter_error(emitter,
                "tag handle must end with '!'");
    }

    handle.pointer ++;

    while (handle.pointer < handle.end-1) {
        if (!IS_ALPHA(handle)) {
            return yaml_emitter_set_emitter_error(emitter,
                    "tag handle must contain alphanumerical characters only");
        }
        MOVE(handle);
    }

    if (prefix.start == prefix.end) {
        return yaml_emitter_set_emitter_error(emitter,
                "tag prefix must not be empty");
    }

    return 1;
}


