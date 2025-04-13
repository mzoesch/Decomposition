// SCC: (yaml_document_get_node)

void yaml_document_get_node(Unknown *document, int index);


// Function: yaml_document_get_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0113Scc_yaml_document_get_node_yaml_document_get_node.fwd"
yaml_document_get_node(yaml_document_t *document, int index)
{
    assert(document);   /* Non-NULL document object is expected. */

    if (index > 0 && document->nodes.start + index <= document->nodes.top) {
        return document->nodes.start + index - 1;
    }
    return NULL;
}


