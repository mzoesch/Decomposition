// SCC: (yaml_emitter_analyze_version_directive)

#include "0007StructType_struct.yaml_version_directive_s.h"


int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_analyze_version_directive(Unknown *emitter, Unknown version_directive);


// Function: yaml_emitter_analyze_version_directive
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0130Scc_yaml_emitter_analyze_version_directive_yaml_emitter_analyze_version_directive.fwd"
yaml_emitter_analyze_version_directive(yaml_emitter_t *emitter,
        yaml_version_directive_t version_directive)
{
    if (version_directive.major != 1 || (
        version_directive.minor != 1
        && version_directive.minor != 2
        )) {
        return yaml_emitter_set_emitter_error(emitter,
                "incompatible %YAML directive");
    }

    return 1;
}


