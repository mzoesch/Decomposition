// SCC: (yaml_parser_load_node_add)

#include "0007StructType_struct.yaml_version_directive_s.h"


int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_parser_load_node_add(Unknown *parser, Unknown *ctx, int index);


// Function: yaml_parser_load_node_add
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0245Scc_yaml_parser_load_node_add_yaml_parser_load_node_add.fwd"
yaml_parser_load_node_add(yaml_parser_t *parser, struct loader_ctx *ctx,
        int index)
{
    struct yaml_node_s *parent;
    int parent_index;

    if (STACK_EMPTY(parser, *ctx)) {
        /* This is the root node, there's no tree to add it to. */
        return 1;
    }

    parent_index = *((*ctx).top - 1);
    parent = &parser->document->nodes.start[parent_index-1];

    switch (parent->type) {
        case YAML_SEQUENCE_NODE:
            if (!STACK_LIMIT(parser, parent->data.sequence.items, INT_MAX-1))
                return 0;
            if (!PUSH(parser, parent->data.sequence.items, index))
                return 0;
            break;
        case YAML_MAPPING_NODE: {
            yaml_node_pair_t pair;
            if (!STACK_EMPTY(parser, parent->data.mapping.pairs)) {
                yaml_node_pair_t *p = parent->data.mapping.pairs.top - 1;
                if (p->key != 0 && p->value == 0) {
                    p->value = index;
                    break;
                }
            }

            pair.key = index;
            pair.value = 0;
            if (!STACK_LIMIT(parser, parent->data.mapping.pairs, INT_MAX-1))
                return 0;
            if (!PUSH(parser, parent->data.mapping.pairs, pair))
                return 0;

            break;
        }
        default:
            assert(0); /* Could not happen. */
            return 0;
    }
    return 1;
}


