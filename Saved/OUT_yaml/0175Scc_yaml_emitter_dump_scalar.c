// SCC: (yaml_emitter_dump_scalar)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


int yaml_emitter_emit(Unknown *emitter, Unknown *event);


int yaml_emitter_dump_scalar(Unknown *emitter, Unknown *node, unsigned char *anchor);


// Function: yaml_emitter_dump_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0175Scc_yaml_emitter_dump_scalar_yaml_emitter_dump_scalar.fwd"
yaml_emitter_dump_scalar(yaml_emitter_t *emitter, yaml_node_t *node,
        yaml_char_t *anchor)
{
    yaml_event_t event;
    yaml_mark_t mark  = { 0, 0, 0 };

    int plain_implicit = (strcmp((char *)node->tag,
                YAML_DEFAULT_SCALAR_TAG) == 0);
    int quoted_implicit = (strcmp((char *)node->tag,
                YAML_DEFAULT_SCALAR_TAG) == 0);

    SCALAR_EVENT_INIT(event, anchor, node->tag, node->data.scalar.value,
            node->data.scalar.length, plain_implicit, quoted_implicit,
            node->data.scalar.style, mark, mark);

    return yaml_emitter_emit(emitter, &event);
}


