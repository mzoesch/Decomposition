// SCC: (yaml_document_end_event_initialize)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_document_end_event_initialize(Unknown *event, int implicit);


// Function: yaml_document_end_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0104Scc_yaml_document_end_event_initialize_yaml_document_end_event_initialize.fwd"
yaml_document_end_event_initialize(yaml_event_t *event, int implicit)
{
    yaml_mark_t mark = { 0, 0, 0 };

    assert(event);      /* Non-NULL emitter object is expected. */

    DOCUMENT_END_EVENT_INIT(*event, implicit, mark, mark);

    return 1;
}


