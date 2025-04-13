// SCC: (yaml_emitter_delete_document_and_anchors)

#include "0008StructType_struct.yaml_node_s.h"


void yaml_document_delete(Unknown *document);
void yaml_free(Unknown *ptr);


void yaml_emitter_delete_document_and_anchors(Unknown *emitter);


// Function: yaml_emitter_delete_document_and_anchors
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0171Scc_yaml_emitter_delete_document_and_anchors_yaml_emitter_delete_document_and_anchors.fwd"
yaml_emitter_delete_document_and_anchors(yaml_emitter_t *emitter)
{
    int index;

    if (!emitter->anchors) {
        yaml_document_delete(emitter->document);
        emitter->document = NULL;
        return;
    }

    for (index = 0; emitter->document->nodes.start + index
            < emitter->document->nodes.top; index ++) {
        yaml_node_t node = emitter->document->nodes.start[index];
        if (!emitter->anchors[index].serialized) {
            yaml_free(node.tag);
            if (node.type == YAML_SCALAR_NODE) {
                yaml_free(node.data.scalar.value);
            }
        }
        if (node.type == YAML_SEQUENCE_NODE) {
            STACK_DEL(emitter, node.data.sequence.items);
        }
        if (node.type == YAML_MAPPING_NODE) {
            STACK_DEL(emitter, node.data.mapping.pairs);
        }
    }

    STACK_DEL(emitter, emitter->document->nodes);
    yaml_free(emitter->anchors);

    emitter->anchors = NULL;
    emitter->last_anchor_id = 0;
    emitter->document = NULL;
}


