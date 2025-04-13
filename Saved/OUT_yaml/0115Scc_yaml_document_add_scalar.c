// SCC: (yaml_document_add_scalar)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0008StructType_struct.yaml_node_s.h"


int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);
void yaml_malloc(unsigned long size);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_document_add_scalar(Unknown *document, const unsigned char *tag, const unsigned char *value, int length, Unknown style);


// Function: yaml_document_add_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0115Scc_yaml_document_add_scalar_yaml_document_add_scalar.fwd"
yaml_document_add_scalar(yaml_document_t *document,
        const yaml_char_t *tag, const yaml_char_t *value, int length,
        yaml_scalar_style_t style)
{
    struct {
        yaml_error_type_t error;
    } context;
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_char_t *tag_copy = NULL;
    yaml_char_t *value_copy = NULL;
    yaml_node_t node;

    assert(document);   /* Non-NULL document object is expected. */
    assert(value);      /* Non-NULL value is expected. */

    if (!tag) {
        tag = (yaml_char_t *)YAML_DEFAULT_SCALAR_TAG;
    }

    if (!yaml_check_utf8(tag, strlen((char *)tag))) goto error;
    tag_copy = yaml_strdup(tag);
    if (!tag_copy) goto error;

    if (length < 0) {
        length = strlen((char *)value);
    }

    if (!yaml_check_utf8(value, length)) goto error;
    value_copy = YAML_MALLOC(length+1);
    if (!value_copy) goto error;
    memcpy(value_copy, value, length);
    value_copy[length] = '\0';

    SCALAR_NODE_INIT(node, tag_copy, value_copy, length, style, mark, mark);
    if (!PUSH(&context, document->nodes, node)) goto error;

    return document->nodes.top - document->nodes.start;

error:
    yaml_free(tag_copy);
    yaml_free(value_copy);

    return 0;
}


