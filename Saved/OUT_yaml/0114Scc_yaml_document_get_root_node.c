// SCC: (yaml_document_get_root_node)

void yaml_document_get_root_node(Unknown *document);


// Function: yaml_document_get_root_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0114Scc_yaml_document_get_root_node_yaml_document_get_root_node.fwd"
yaml_document_get_root_node(yaml_document_t *document)
{
    assert(document);   /* Non-NULL document object is expected. */

    if (document->nodes.top != document->nodes.start) {
        return document->nodes.start;
    }
    return NULL;
}


