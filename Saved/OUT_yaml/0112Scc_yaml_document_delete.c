// SCC: (yaml_document_delete)

#include "0008StructType_struct.yaml_node_s.h"


void yaml_free(Unknown *ptr);


void yaml_document_delete(Unknown *document);


// Function: yaml_document_delete
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0112Scc_yaml_document_delete_yaml_document_delete.fwd"
yaml_document_delete(yaml_document_t *document)
{
    yaml_tag_directive_t *tag_directive;

    assert(document);   /* Non-NULL document object is expected. */

    while (!STACK_EMPTY(&context, document->nodes)) {
        yaml_node_t node = POP(&context, document->nodes);
        yaml_free(node.tag);
        switch (node.type) {
            case YAML_SCALAR_NODE:
                yaml_free(node.data.scalar.value);
                break;
            case YAML_SEQUENCE_NODE:
                STACK_DEL(&context, node.data.sequence.items);
                break;
            case YAML_MAPPING_NODE:
                STACK_DEL(&context, node.data.mapping.pairs);
                break;
            default:
                assert(0);  /* Should not happen. */
        }
    }
    STACK_DEL(&context, document->nodes);

    yaml_free(document->version_directive);
    for (tag_directive = document->tag_directives.start;
            tag_directive != document->tag_directives.end;
            tag_directive++) {
        yaml_free(tag_directive->handle);
        yaml_free(tag_directive->prefix);
    }
    yaml_free(document->tag_directives.start);

    memset(document, 0, sizeof(yaml_document_t));
}


