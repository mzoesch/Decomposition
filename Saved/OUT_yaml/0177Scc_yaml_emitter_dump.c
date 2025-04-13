// SCC: (yaml_emitter_dump)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


int yaml_emitter_open(Unknown *emitter);
int yaml_emitter_close(Unknown *emitter);
void yaml_emitter_delete_document_and_anchors(Unknown *emitter);
void yaml_malloc(unsigned long size);
int yaml_emitter_emit(Unknown *emitter, Unknown *event);
void yaml_emitter_anchor_node(Unknown *emitter, int index);
int yaml_emitter_dump_node(Unknown *emitter, int index);


int yaml_emitter_dump(Unknown *emitter, Unknown *document);


// Function: yaml_emitter_dump
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0177Scc_yaml_emitter_dump_yaml_emitter_dump.fwd"
yaml_emitter_dump(yaml_emitter_t *emitter, yaml_document_t *document)
{
    yaml_event_t event;
    yaml_mark_t mark = { 0, 0, 0 };

    assert(emitter);            /* Non-NULL emitter object is required. */
    assert(document);           /* Non-NULL emitter object is expected. */

    emitter->document = document;

    if (!emitter->opened) {
        if (!yaml_emitter_open(emitter)) goto error;
    }

    if (STACK_EMPTY(emitter, document->nodes)) {
        if (!yaml_emitter_close(emitter)) goto error;
        yaml_emitter_delete_document_and_anchors(emitter);
        return 1;
    }

    assert(emitter->opened);    /* Emitter should be opened. */

    emitter->anchors = (yaml_anchors_t*)yaml_malloc(sizeof(*(emitter->anchors))
            * (document->nodes.top - document->nodes.start));
    if (!emitter->anchors) goto error;
    memset(emitter->anchors, 0, sizeof(*(emitter->anchors))
            * (document->nodes.top - document->nodes.start));

    DOCUMENT_START_EVENT_INIT(event, document->version_directive,
            document->tag_directives.start, document->tag_directives.end,
            document->start_implicit, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) goto error;

    yaml_emitter_anchor_node(emitter, 1);
    if (!yaml_emitter_dump_node(emitter, 1)) goto error;

    DOCUMENT_END_EVENT_INIT(event, document->end_implicit, mark, mark);
    if (!yaml_emitter_emit(emitter, &event)) goto error;

    yaml_emitter_delete_document_and_anchors(emitter);

    return 1;

error:

    yaml_emitter_delete_document_and_anchors(emitter);

    return 0;
}


