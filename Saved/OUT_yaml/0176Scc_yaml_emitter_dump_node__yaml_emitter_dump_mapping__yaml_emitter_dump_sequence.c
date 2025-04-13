// SCC: (yaml_emitter_dump_node, yaml_emitter_dump_mapping, yaml_emitter_dump_sequence)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


void yaml_emitter_generate_anchor(Unknown *emitter, int anchor_id);
int yaml_emitter_dump_alias(Unknown *emitter, unsigned char *anchor);
int yaml_emitter_dump_scalar(Unknown *emitter, Unknown *node, unsigned char *anchor);
int yaml_emitter_dump_sequence(Unknown *emitter, Unknown *node, unsigned char *anchor);
int yaml_emitter_dump_mapping(Unknown *emitter, Unknown *node, unsigned char *anchor);
int yaml_emitter_emit(Unknown *emitter, Unknown *event);
int yaml_emitter_dump_node(Unknown *emitter, int index);


// Function: yaml_emitter_dump_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0176Scc_yaml_emitter_dump_node__yaml_emitter_dump_mapping__yaml_emitter_dump_sequence_yaml_emitter_dump_node.fwd"
yaml_emitter_dump_node(yaml_emitter_t *emitter, int index)
{
    yaml_node_t *node = emitter->document->nodes.start + index - 1;
    int anchor_id = emitter->anchors[index-1].anchor;
    yaml_char_t *anchor = NULL;

    if (anchor_id) {
        anchor = yaml_emitter_generate_anchor(emitter, anchor_id);
        if (!anchor) return 0;
    }

    if (emitter->anchors[index-1].serialized) {
        return yaml_emitter_dump_alias(emitter, anchor);
    }

    emitter->anchors[index-1].serialized = 1;

    switch (node->type) {
        case YAML_SCALAR_NODE:
            return yaml_emitter_dump_scalar(emitter, node, anchor);
        case YAML_SEQUENCE_NODE:
            return yaml_emitter_dump_sequence(emitter, node, anchor);
        case YAML_MAPPING_NODE:
            return yaml_emitter_dump_mapping(emitter, node, anchor);
        default:
            assert(0);      /* Could not happen. */
            break;
    }

    return 0;       /* Could not happen. */
}


// Function: yaml_emitter_dump_mapping
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0176Scc_yaml_emitter_dump_node__yaml_emitter_dump_mapping__yaml_emitter_dump_sequence_yaml_emitter_dump_mapping.fwd"
yaml_emitter_dump_mapping(yaml_emitter_t *emitter, yaml_node_t *node,
        yaml_char_t *anchor)
{
    yaml_event_t event;
    yaml_mark_t mark  = { 0, 0, 0 };

    int implicit = (strcmp((char *)node->tag, YAML_DEFAULT_MAPPING_TAG) == 0);

    yaml_node_pair_t *pair;

    MAPPING_START_EVENT_INIT(event, anchor, node->tag, implicit,
            node->data.mapping.style, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) return 0;

    for (pair = node->data.mapping.pairs.start;
            pair < node->data.mapping.pairs.top; pair ++) {
        if (!yaml_emitter_dump_node(emitter, pair->key)) return 0;
        if (!yaml_emitter_dump_node(emitter, pair->value)) return 0;
    }

    MAPPING_END_EVENT_INIT(event, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) return 0;

    return 1;
}


// Function: yaml_emitter_dump_sequence
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0176Scc_yaml_emitter_dump_node__yaml_emitter_dump_mapping__yaml_emitter_dump_sequence_yaml_emitter_dump_sequence.fwd"
yaml_emitter_dump_sequence(yaml_emitter_t *emitter, yaml_node_t *node,
        yaml_char_t *anchor)
{
    yaml_event_t event;
    yaml_mark_t mark  = { 0, 0, 0 };

    int implicit = (strcmp((char *)node->tag, YAML_DEFAULT_SEQUENCE_TAG) == 0);

    yaml_node_item_t *item;

    SEQUENCE_START_EVENT_INIT(event, anchor, node->tag, implicit,
            node->data.sequence.style, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) return 0;

    for (item = node->data.sequence.items.start;
            item < node->data.sequence.items.top; item ++) {
        if (!yaml_emitter_dump_node(emitter, *item)) return 0;
    }

    SEQUENCE_END_EVENT_INIT(event, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) return 0;

    return 1;
}


