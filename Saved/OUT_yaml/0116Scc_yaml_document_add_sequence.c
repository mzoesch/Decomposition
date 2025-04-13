// SCC: (yaml_document_add_sequence)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0008StructType_struct.yaml_node_s.h"


int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);
void yaml_malloc(unsigned long size);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_document_add_sequence(Unknown *document, const unsigned char *tag, Unknown style);


// Function: yaml_document_add_sequence
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0116Scc_yaml_document_add_sequence_yaml_document_add_sequence.fwd"
yaml_document_add_sequence(yaml_document_t *document,
        const yaml_char_t *tag, yaml_sequence_style_t style)
{
    struct {
        yaml_error_type_t error;
    } context;
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_char_t *tag_copy = NULL;
    struct {
        yaml_node_item_t *start;
        yaml_node_item_t *end;
        yaml_node_item_t *top;
    } items = { NULL, NULL, NULL };
    yaml_node_t node;

    assert(document);   /* Non-NULL document object is expected. */

    if (!tag) {
        tag = (yaml_char_t *)YAML_DEFAULT_SEQUENCE_TAG;
    }

    if (!yaml_check_utf8(tag, strlen((char *)tag))) goto error;
    tag_copy = yaml_strdup(tag);
    if (!tag_copy) goto error;

    if (!STACK_INIT(&context, items, yaml_node_item_t*)) goto error;

    SEQUENCE_NODE_INIT(node, tag_copy, items.start, items.end,
            style, mark, mark);
    if (!PUSH(&context, document->nodes, node)) goto error;

    return document->nodes.top - document->nodes.start;

error:
    STACK_DEL(&context, items);
    yaml_free(tag_copy);

    return 0;
}


