// SCC: (yaml_parser_load_nodes)

#include "0006StructType_struct.yaml_event_s.h"


int yaml_parser_parse(Unknown *parser, Unknown *event);
int yaml_parser_load_alias(Unknown *parser, Unknown *event, Unknown *ctx);
int yaml_parser_load_scalar(Unknown *parser, Unknown *event, Unknown *ctx);
int yaml_parser_load_sequence(Unknown *parser, Unknown *event, Unknown *ctx);
int yaml_parser_load_sequence_end(Unknown *parser, Unknown *event, Unknown *ctx);
int yaml_parser_load_mapping(Unknown *parser, Unknown *event, Unknown *ctx);
int yaml_parser_load_mapping_end(Unknown *parser, Unknown *event, Unknown *ctx);


int yaml_parser_load_nodes(Unknown *parser, Unknown *ctx);


// Function: yaml_parser_load_nodes
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0255Scc_yaml_parser_load_nodes_yaml_parser_load_nodes.fwd"
yaml_parser_load_nodes(yaml_parser_t *parser, struct loader_ctx *ctx)
{
    yaml_event_t event;

    do {
        if (!yaml_parser_parse(parser, &event)) return 0;

        switch (event.type) {
            case YAML_ALIAS_EVENT:
                if (!yaml_parser_load_alias(parser, &event, ctx)) return 0;
                break;
            case YAML_SCALAR_EVENT:
                if (!yaml_parser_load_scalar(parser, &event, ctx)) return 0;
                break;
            case YAML_SEQUENCE_START_EVENT:
                if (!yaml_parser_load_sequence(parser, &event, ctx)) return 0;
                break;
            case YAML_SEQUENCE_END_EVENT:
                if (!yaml_parser_load_sequence_end(parser, &event, ctx))
                    return 0;
                break;
            case YAML_MAPPING_START_EVENT:
                if (!yaml_parser_load_mapping(parser, &event, ctx)) return 0;
                break;
            case YAML_MAPPING_END_EVENT:
                if (!yaml_parser_load_mapping_end(parser, &event, ctx))
                    return 0;
                break;
            default:
                assert(0);  /* Could not happen. */
                return 0;
            case YAML_DOCUMENT_END_EVENT:
                break;
        }
    } while (event.type != YAML_DOCUMENT_END_EVENT);

    parser->document->end_implicit = event.data.document_end.implicit;
    parser->document->end_mark = event.end_mark;

    return 1;
}


