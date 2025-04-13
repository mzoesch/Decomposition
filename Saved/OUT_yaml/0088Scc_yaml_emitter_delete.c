// SCC: (yaml_emitter_delete)

#include "0000StructType_struct.yaml_tag_directive_s.h"


void yaml_free(Unknown *ptr);
void yaml_event_delete(Unknown *event);


void yaml_emitter_delete(Unknown *emitter);


// Function: yaml_emitter_delete
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0088Scc_yaml_emitter_delete_yaml_emitter_delete.fwd"
yaml_emitter_delete(yaml_emitter_t *emitter)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    BUFFER_DEL(emitter, emitter->buffer);
    BUFFER_DEL(emitter, emitter->raw_buffer);
    STACK_DEL(emitter, emitter->states);
    while (!QUEUE_EMPTY(emitter, emitter->events)) {
        yaml_event_delete(&DEQUEUE(emitter, emitter->events));
    }
    QUEUE_DEL(emitter, emitter->events);
    STACK_DEL(emitter, emitter->indents);
    while (!STACK_EMPTY(empty, emitter->tag_directives)) {
        yaml_tag_directive_t tag_directive = POP(emitter, emitter->tag_directives);
        yaml_free(tag_directive.handle);
        yaml_free(tag_directive.prefix);
    }
    STACK_DEL(emitter, emitter->tag_directives);
    yaml_free(emitter->anchors);

    memset(emitter, 0, sizeof(yaml_emitter_t));
}


