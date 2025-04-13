// SCC: (yaml_document_add_mapping)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0008StructType_struct.yaml_node_s.h"


int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);
void yaml_malloc(unsigned long size);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_document_add_mapping(Unknown *document, const unsigned char *tag, Unknown style);


// Function: yaml_document_add_mapping
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0117Scc_yaml_document_add_mapping_yaml_document_add_mapping.fwd"
yaml_document_add_mapping(yaml_document_t *document,
        const yaml_char_t *tag, yaml_mapping_style_t style)
{
    struct {
        yaml_error_type_t error;
    } context;
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_char_t *tag_copy = NULL;
    struct {
        yaml_node_pair_t *start;
        yaml_node_pair_t *end;
        yaml_node_pair_t *top;
    } pairs = { NULL, NULL, NULL };
    yaml_node_t node;

    assert(document);   /* Non-NULL document object is expected. */

    if (!tag) {
        tag = (yaml_char_t *)YAML_DEFAULT_MAPPING_TAG;
    }

    if (!yaml_check_utf8(tag, strlen((char *)tag))) goto error;
    tag_copy = yaml_strdup(tag);
    if (!tag_copy) goto error;

    if (!STACK_INIT(&context, pairs, yaml_node_pair_t*)) goto error;

    MAPPING_NODE_INIT(node, tag_copy, pairs.start, pairs.end,
            style, mark, mark);
    if (!PUSH(&context, document->nodes, node)) goto error;

    return document->nodes.top - document->nodes.start;

error:
    STACK_DEL(&context, pairs);
    yaml_free(tag_copy);

    return 0;
}


