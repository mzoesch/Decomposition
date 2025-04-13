// SCC: (yaml_emitter_need_more_events)

int yaml_emitter_need_more_events(Unknown *emitter);


// Function: yaml_emitter_need_more_events
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0120Scc_yaml_emitter_need_more_events_yaml_emitter_need_more_events.fwd"
yaml_emitter_need_more_events(yaml_emitter_t *emitter)
{
    int level = 0;
    int accumulate = 0;
    yaml_event_t *event;

    if (QUEUE_EMPTY(emitter, emitter->events))
        return 1;

    switch (emitter->events.head->type) {
        case YAML_DOCUMENT_START_EVENT:
            accumulate = 1;
            break;
        case YAML_SEQUENCE_START_EVENT:
            accumulate = 2;
            break;
        case YAML_MAPPING_START_EVENT:
            accumulate = 3;
            break;
        default:
            return 0;
    }

    if (emitter->events.tail - emitter->events.head > accumulate)
        return 0;

    for (event = emitter->events.head; event != emitter->events.tail; event ++) {
        switch (event->type) {
            case YAML_STREAM_START_EVENT:
            case YAML_DOCUMENT_START_EVENT:
            case YAML_SEQUENCE_START_EVENT:
            case YAML_MAPPING_START_EVENT:
                level += 1;
                break;
            case YAML_STREAM_END_EVENT:
            case YAML_DOCUMENT_END_EVENT:
            case YAML_SEQUENCE_END_EVENT:
            case YAML_MAPPING_END_EVENT:
                level -= 1;
                break;
            default:
                break;
        }
        if (!level)
            return 0;
    }

    return 1;
}


