// SCC: (yaml_parser_load_sequence_end)

int yaml_parser_load_sequence_end(Unknown *parser, Unknown *event, Unknown *ctx);


// Function: yaml_parser_load_sequence_end
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0252Scc_yaml_parser_load_sequence_end_yaml_parser_load_sequence_end.fwd"
yaml_parser_load_sequence_end(yaml_parser_t *parser, yaml_event_t *event,
        struct loader_ctx *ctx)
{
    int index;

    assert(((*ctx).top - (*ctx).start) > 0);

    index = *((*ctx).top - 1);
    assert(parser->document->nodes.start[index-1].type == YAML_SEQUENCE_NODE);
    parser->document->nodes.start[index-1].end_mark = event->end_mark;

    (void)POP(parser, *ctx);

    return 1;
}


