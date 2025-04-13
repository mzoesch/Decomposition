// SCC: (yaml_mapping_end_event_initialize)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_mapping_end_event_initialize(Unknown *event);


// Function: yaml_mapping_end_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0110Scc_yaml_mapping_end_event_initialize_yaml_mapping_end_event_initialize.fwd"
yaml_mapping_end_event_initialize(yaml_event_t *event)
{
    yaml_mark_t mark = { 0, 0, 0 };

    assert(event);      /* Non-NULL event object is expected. */

    MAPPING_END_EVENT_INIT(*event, mark, mark);

    return 1;
}


