// SCC: (yaml_emitter_initialize)

void yaml_malloc(unsigned long size);
void yaml_free(Unknown *ptr);


int yaml_emitter_initialize(Unknown *emitter);


// Function: yaml_emitter_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0086Scc_yaml_emitter_initialize_yaml_emitter_initialize.fwd"
yaml_emitter_initialize(yaml_emitter_t *emitter)
{
    assert(emitter);    /* Non-NULL emitter object expected. */

    memset(emitter, 0, sizeof(yaml_emitter_t));
    if (!BUFFER_INIT(emitter, emitter->buffer, OUTPUT_BUFFER_SIZE))
        goto error;
    if (!BUFFER_INIT(emitter, emitter->raw_buffer, OUTPUT_RAW_BUFFER_SIZE))
        goto error;
    if (!STACK_INIT(emitter, emitter->states, yaml_emitter_state_t*))
        goto error;
    if (!QUEUE_INIT(emitter, emitter->events, INITIAL_QUEUE_SIZE, yaml_event_t*))
        goto error;
    if (!STACK_INIT(emitter, emitter->indents, int*))
        goto error;
    if (!STACK_INIT(emitter, emitter->tag_directives, yaml_tag_directive_t*))
        goto error;

    return 1;

error:

    BUFFER_DEL(emitter, emitter->buffer);
    BUFFER_DEL(emitter, emitter->raw_buffer);
    STACK_DEL(emitter, emitter->states);
    QUEUE_DEL(emitter, emitter->events);
    STACK_DEL(emitter, emitter->indents);
    STACK_DEL(emitter, emitter->tag_directives);

    return 0;
}


