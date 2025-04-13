// SCC: (yaml_emitter_emit)

int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);
void yaml_event_delete(Unknown *event);
int yaml_emitter_need_more_events(Unknown *emitter);
int yaml_emitter_analyze_event(Unknown *emitter, Unknown *event);
int yaml_emitter_state_machine(Unknown *emitter, Unknown *event);


int yaml_emitter_emit(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0168Scc_yaml_emitter_emit_yaml_emitter_emit.fwd"
yaml_emitter_emit(yaml_emitter_t *emitter, yaml_event_t *event)
{
    if (!ENQUEUE(emitter, emitter->events, *event)) {
        yaml_event_delete(event);
        return 0;
    }

    while (!yaml_emitter_need_more_events(emitter)) {
        if (!yaml_emitter_analyze_event(emitter, emitter->events.head))
            return 0;
        if (!yaml_emitter_state_machine(emitter, emitter->events.head))
            return 0;
        yaml_event_delete(&DEQUEUE(emitter, emitter->events));
    }

    return 1;
}


