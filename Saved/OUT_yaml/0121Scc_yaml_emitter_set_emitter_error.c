// SCC: (yaml_emitter_set_emitter_error)

int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


// Function: yaml_emitter_set_emitter_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0121Scc_yaml_emitter_set_emitter_error_yaml_emitter_set_emitter_error.fwd"
yaml_emitter_set_emitter_error(yaml_emitter_t *emitter, const char *problem)
{
    emitter->error = YAML_EMITTER_ERROR;
    emitter->problem = problem;

    return 0;
}


