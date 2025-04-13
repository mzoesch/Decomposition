// SCC: (yaml_parser_load_scalar)

#include "0008StructType_struct.yaml_node_s.h"


void yaml_free(Unknown *ptr);
void yaml_strdup(const unsigned char *str);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_register_anchor(Unknown *parser, int index, unsigned char *anchor);
int yaml_parser_load_node_add(Unknown *parser, Unknown *ctx, int index);


int yaml_parser_load_scalar(Unknown *parser, Unknown *event, Unknown *ctx);


// Function: yaml_parser_load_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0250Scc_yaml_parser_load_scalar_yaml_parser_load_scalar.fwd"
yaml_parser_load_scalar(yaml_parser_t *parser, yaml_event_t *event,
        struct loader_ctx *ctx)
{
    yaml_node_t node;
    int index;
    yaml_char_t *tag = event->data.scalar.tag;

    if (!STACK_LIMIT(parser, parser->document->nodes, INT_MAX-1)) goto error;

    if (!tag || strcmp((char *)tag, "!") == 0) {
        yaml_free(tag);
        tag = yaml_strdup((yaml_char_t *)YAML_DEFAULT_SCALAR_TAG);
        if (!tag) goto error;
    }

    SCALAR_NODE_INIT(node, tag, event->data.scalar.value,
            event->data.scalar.length, event->data.scalar.style,
            event->start_mark, event->end_mark);

    if (!PUSH(parser, parser->document->nodes, node)) goto error;

    index = parser->document->nodes.top - parser->document->nodes.start;

    if (!yaml_parser_register_anchor(parser, index,
                event->data.scalar.anchor)) return 0;

    return yaml_parser_load_node_add(parser, ctx, index);

error:
    yaml_free(tag);
    yaml_free(event->data.scalar.anchor);
    yaml_free(event->data.scalar.value);
    return 0;
}


