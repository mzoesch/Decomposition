// SCC: (yaml_document_append_mapping_pair)

#include "0007StructType_struct.yaml_version_directive_s.h"


int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_document_append_mapping_pair(Unknown *document, int mapping, int key, int value);


// Function: yaml_document_append_mapping_pair
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0119Scc_yaml_document_append_mapping_pair_yaml_document_append_mapping_pair.fwd"
yaml_document_append_mapping_pair(yaml_document_t *document,
        int mapping, int key, int value)
{
    struct {
        yaml_error_type_t error;
    } context;

    yaml_node_pair_t pair;

    assert(document);       /* Non-NULL document is required. */
    assert(mapping > 0
            && document->nodes.start + mapping <= document->nodes.top);
                            /* Valid mapping id is required. */
    assert(document->nodes.start[mapping-1].type == YAML_MAPPING_NODE);
                            /* A mapping node is required. */
    assert(key > 0 && document->nodes.start + key <= document->nodes.top);
                            /* Valid key id is required. */
    assert(value > 0 && document->nodes.start + value <= document->nodes.top);
                            /* Valid value id is required. */

    pair.key = key;
    pair.value = value;

    if (!PUSH(&context,
                document->nodes.start[mapping-1].data.mapping.pairs, pair))
        return 0;

    return 1;
}


