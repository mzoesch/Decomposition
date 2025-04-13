// SCC: (yaml_parser_load_document)

void yaml_malloc(unsigned long size);
int yaml_parser_load_nodes(Unknown *parser, Unknown *ctx);
void yaml_free(Unknown *ptr);


int yaml_parser_load_document(Unknown *parser, Unknown *event);


// Function: yaml_parser_load_document
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0256Scc_yaml_parser_load_document_yaml_parser_load_document.fwd"
yaml_parser_load_document(yaml_parser_t *parser, yaml_event_t *event)
{
    struct loader_ctx ctx = { NULL, NULL, NULL };

    assert(event->type == YAML_DOCUMENT_START_EVENT);
                        /* DOCUMENT-START is expected. */

    parser->document->version_directive
        = event->data.document_start.version_directive;
    parser->document->tag_directives.start
        = event->data.document_start.tag_directives.start;
    parser->document->tag_directives.end
        = event->data.document_start.tag_directives.end;
    parser->document->start_implicit
        = event->data.document_start.implicit;
    parser->document->start_mark = event->start_mark;

    if (!STACK_INIT(parser, ctx, int*)) return 0;
    if (!yaml_parser_load_nodes(parser, &ctx)) {
        STACK_DEL(parser, ctx);
        return 0;
    }
    STACK_DEL(parser, ctx);

    return 1;
}


