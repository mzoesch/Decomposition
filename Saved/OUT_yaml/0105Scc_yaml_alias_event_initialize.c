// SCC: (yaml_alias_event_initialize)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);


int yaml_alias_event_initialize(Unknown *event, const unsigned char *anchor);


// Function: yaml_alias_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0105Scc_yaml_alias_event_initialize_yaml_alias_event_initialize.fwd"
yaml_alias_event_initialize(yaml_event_t *event, const yaml_char_t *anchor)
{
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_char_t *anchor_copy = NULL;

    assert(event);      /* Non-NULL event object is expected. */
    assert(anchor);     /* Non-NULL anchor is expected. */

    if (!yaml_check_utf8(anchor, strlen((char *)anchor))) return 0;

    anchor_copy = yaml_strdup(anchor);
    if (!anchor_copy)
        return 0;

    ALIAS_EVENT_INIT(*event, anchor_copy, mark, mark);

    return 1;
}


