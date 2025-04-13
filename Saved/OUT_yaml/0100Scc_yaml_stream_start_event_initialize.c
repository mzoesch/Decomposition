// SCC: (yaml_stream_start_event_initialize)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_stream_start_event_initialize(Unknown *event, Unknown encoding);


// Function: yaml_stream_start_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0100Scc_yaml_stream_start_event_initialize_yaml_stream_start_event_initialize.fwd"
yaml_stream_start_event_initialize(yaml_event_t *event,
        yaml_encoding_t encoding)
{
    yaml_mark_t mark = { 0, 0, 0 };

    assert(event);  /* Non-NULL event object is expected. */

    STREAM_START_EVENT_INIT(*event, encoding, mark, mark);

    return 1;
}


