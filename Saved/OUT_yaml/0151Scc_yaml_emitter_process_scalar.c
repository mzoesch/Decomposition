// SCC: (yaml_emitter_process_scalar)

int yaml_emitter_write_plain_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);
int yaml_emitter_write_single_quoted_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);
int yaml_emitter_write_double_quoted_scalar(Unknown *emitter, unsigned char *value, unsigned long length, int allow_breaks);
int yaml_emitter_write_literal_scalar(Unknown *emitter, unsigned char *value, unsigned long length);
int yaml_emitter_write_folded_scalar(Unknown *emitter, unsigned char *value, unsigned long length);


int yaml_emitter_process_scalar(Unknown *emitter);


// Function: yaml_emitter_process_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0151Scc_yaml_emitter_process_scalar_yaml_emitter_process_scalar.fwd"
yaml_emitter_process_scalar(yaml_emitter_t *emitter)
{
    switch (emitter->scalar_data.style)
    {
        case YAML_PLAIN_SCALAR_STYLE:
            return yaml_emitter_write_plain_scalar(emitter,
                    emitter->scalar_data.value, emitter->scalar_data.length,
                    !emitter->simple_key_context);

        case YAML_SINGLE_QUOTED_SCALAR_STYLE:
            return yaml_emitter_write_single_quoted_scalar(emitter,
                    emitter->scalar_data.value, emitter->scalar_data.length,
                    !emitter->simple_key_context);

        case YAML_DOUBLE_QUOTED_SCALAR_STYLE:
            return yaml_emitter_write_double_quoted_scalar(emitter,
                    emitter->scalar_data.value, emitter->scalar_data.length,
                    !emitter->simple_key_context);

        case YAML_LITERAL_SCALAR_STYLE:
            return yaml_emitter_write_literal_scalar(emitter,
                    emitter->scalar_data.value, emitter->scalar_data.length);

        case YAML_FOLDED_SCALAR_STYLE:
            return yaml_emitter_write_folded_scalar(emitter,
                    emitter->scalar_data.value, emitter->scalar_data.length);

        default:
            assert(1);      /* Impossible. */
    }

    return 0;
}


