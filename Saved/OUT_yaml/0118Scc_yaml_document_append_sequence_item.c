// SCC: (yaml_document_append_sequence_item)

int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_document_append_sequence_item(Unknown *document, int sequence, int item);


// Function: yaml_document_append_sequence_item
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0118Scc_yaml_document_append_sequence_item_yaml_document_append_sequence_item.fwd"
yaml_document_append_sequence_item(yaml_document_t *document,
        int sequence, int item)
{
    struct {
        yaml_error_type_t error;
    } context;

    assert(document);       /* Non-NULL document is required. */
    assert(sequence > 0
            && document->nodes.start + sequence <= document->nodes.top);
                            /* Valid sequence id is required. */
    assert(document->nodes.start[sequence-1].type == YAML_SEQUENCE_NODE);
                            /* A sequence node is required. */
    assert(item > 0 && document->nodes.start + item <= document->nodes.top);
                            /* Valid item id is required. */

    if (!PUSH(&context,
                document->nodes.start[sequence-1].data.sequence.items, item))
        return 0;

    return 1;
}


