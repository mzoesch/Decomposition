// SCC: (yaml_emitter_analyze_anchor)

int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_analyze_anchor(Unknown *emitter, unsigned char *anchor, int alias);


// Function: yaml_emitter_analyze_anchor
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0122Scc_yaml_emitter_analyze_anchor_yaml_emitter_analyze_anchor.fwd"
yaml_emitter_analyze_anchor(yaml_emitter_t *emitter,
        yaml_char_t *anchor, int alias)
{
    size_t anchor_length;
    yaml_string_t string;

    anchor_length = strlen((char *)anchor);
    STRING_ASSIGN(string, anchor, anchor_length);

    if (string.start == string.end) {
        return yaml_emitter_set_emitter_error(emitter, alias ?
                "alias value must not be empty" :
                "anchor value must not be empty");
    }

    while (string.pointer != string.end) {
        if (!IS_ALPHA(string)) {
            return yaml_emitter_set_emitter_error(emitter, alias ?
                    "alias value must contain alphanumerical characters only" :
                    "anchor value must contain alphanumerical characters only");
        }
        MOVE(string);
    }

    emitter->anchor_data.anchor = string.start;
    emitter->anchor_data.anchor_length = string.end - string.start;
    emitter->anchor_data.alias = alias;

    return 1;
}


