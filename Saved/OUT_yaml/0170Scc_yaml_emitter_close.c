// SCC: (yaml_emitter_close)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


int yaml_emitter_emit(Unknown *emitter, Unknown *event);


int yaml_emitter_close(Unknown *emitter);


// Function: yaml_emitter_close
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0170Scc_yaml_emitter_close_yaml_emitter_close.fwd"
yaml_emitter_close(yaml_emitter_t *emitter)
{
    yaml_event_t event;
    yaml_mark_t mark = { 0, 0, 0 };

    assert(emitter);            /* Non-NULL emitter object is required. */
    assert(emitter->opened);    /* Emitter should be opened. */

    if (emitter->closed) return 1;

    STREAM_END_EVENT_INIT(event, mark, mark);

    if (!yaml_emitter_emit(emitter, &event)) {
        return 0;
    }

    emitter->closed = 1;

    return 1;
}


