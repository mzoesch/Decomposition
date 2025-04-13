// SCC: (yaml_emitter_set_writer_error)

int yaml_emitter_set_writer_error(Unknown *emitter, const char *problem);


// Function: yaml_emitter_set_writer_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/writer.c
#include ".0126Scc_yaml_emitter_set_writer_error_yaml_emitter_set_writer_error.fwd"
yaml_emitter_set_writer_error(yaml_emitter_t *emitter, const char *problem)
{
    emitter->error = YAML_WRITER_ERROR;
    emitter->problem = problem;

    return 0;
}


