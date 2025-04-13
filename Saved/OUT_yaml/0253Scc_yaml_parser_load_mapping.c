// SCC: (yaml_parser_load_mapping)

#include "0008StructType_struct.yaml_node_s.h"


void yaml_free(Unknown *ptr);
void yaml_strdup(const unsigned char *str);
void yaml_malloc(unsigned long size);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_register_anchor(Unknown *parser, int index, unsigned char *anchor);
int yaml_parser_load_node_add(Unknown *parser, Unknown *ctx, int index);


int yaml_parser_load_mapping(Unknown *parser, Unknown *event, Unknown *ctx);


// Function: yaml_parser_load_mapping
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0253Scc_yaml_parser_load_mapping_yaml_parser_load_mapping.fwd"
yaml_parser_load_mapping(yaml_parser_t *parser, yaml_event_t *event,
        struct loader_ctx *ctx)
{
    yaml_node_t node;
    struct {
        yaml_node_pair_t *start;
        yaml_node_pair_t *end;
        yaml_node_pair_t *top;
    } pairs = { NULL, NULL, NULL };
    int index;
    yaml_char_t *tag = event->data.mapping_start.tag;

    if (!STACK_LIMIT(parser, parser->document->nodes, INT_MAX-1)) goto error;

    if (!tag || strcmp((char *)tag, "!") == 0) {
        yaml_free(tag);
        tag = yaml_strdup((yaml_char_t *)YAML_DEFAULT_MAPPING_TAG);
        if (!tag) goto error;
    }

    if (!STACK_INIT(parser, pairs, yaml_node_pair_t*)) goto error;

    MAPPING_NODE_INIT(node, tag, pairs.start, pairs.end,
            event->data.mapping_start.style,
            event->start_mark, event->end_mark);

    if (!PUSH(parser, parser->document->nodes, node)) goto error;

    index = parser->document->nodes.top - parser->document->nodes.start;

    if (!yaml_parser_register_anchor(parser, index,
                event->data.mapping_start.anchor)) return 0;

    if (!yaml_parser_load_node_add(parser, ctx, index)) return 0;

    if (!STACK_LIMIT(parser, *ctx, INT_MAX-1)) return 0;
    if (!PUSH(parser, *ctx, index)) return 0;

    return 1;

error:
    yaml_free(tag);
    yaml_free(event->data.mapping_start.anchor);
    return 0;
}


