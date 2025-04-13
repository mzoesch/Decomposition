// SCC: (yaml_parser_load)

#include "0006StructType_struct.yaml_event_s.h"


void yaml_malloc(unsigned long size);
int yaml_parser_parse(Unknown *parser, Unknown *event);
int yaml_parser_load_document(Unknown *parser, Unknown *event);
void yaml_parser_delete_aliases(Unknown *parser);
void yaml_document_delete(Unknown *document);


int yaml_parser_load(Unknown *parser, Unknown *document);


// Function: yaml_parser_load
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0258Scc_yaml_parser_load_yaml_parser_load.fwd"
yaml_parser_load(yaml_parser_t *parser, yaml_document_t *document)
{
    yaml_event_t event;

    assert(parser);     /* Non-NULL parser object is expected. */
    assert(document);   /* Non-NULL document object is expected. */

    memset(document, 0, sizeof(yaml_document_t));
    if (!STACK_INIT(parser, document->nodes, yaml_node_t*))
        goto error;

    if (!parser->stream_start_produced) {
        if (!yaml_parser_parse(parser, &event)) goto error;
        assert(event.type == YAML_STREAM_START_EVENT);
                        /* STREAM-START is expected. */
    }

    if (parser->stream_end_produced) {
        return 1;
    }

    if (!yaml_parser_parse(parser, &event)) goto error;
    if (event.type == YAML_STREAM_END_EVENT) {
        return 1;
    }

    if (!STACK_INIT(parser, parser->aliases, yaml_alias_data_t*))
        goto error;

    parser->document = document;

    if (!yaml_parser_load_document(parser, &event)) goto error;

    yaml_parser_delete_aliases(parser);
    parser->document = NULL;

    return 1;

error:

    yaml_parser_delete_aliases(parser);
    yaml_document_delete(document);
    parser->document = NULL;

    return 0;
}


