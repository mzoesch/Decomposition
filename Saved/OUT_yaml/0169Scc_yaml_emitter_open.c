// SCC: (yaml_emitter_open)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


int yaml_emitter_emit(Unknown *emitter, Unknown *event);


int yaml_emitter_open(Unknown *emitter);


// Function: yaml_emitter_open
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0169Scc_yaml_emitter_open_yaml_emitter_open.fwd"
yaml_emitter_open(yaml_emitter_t *emitter)
{
    yaml_event_t event;
    yaml_mark_t mark = { 0, 0, 0 };

    assert(emitter);            /* Non-NULL emitter object is required. */
    assert(!emitter->opened);   /* Emitter should not be opened yet. */

    STREAM_START_EVENT_INIT(event, YAML_ANY_ENCODING, mark, mark);

    if (!yaml_emitter_emit(emitter, &event)) {
        return 0;
    }

    emitter->opened = 1;

    return 1;
}


