// SCC: (yaml_mapping_start_event_initialize)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);
void yaml_free(Unknown *ptr);


int yaml_mapping_start_event_initialize(Unknown *event, const unsigned char *anchor, const unsigned char *tag, int implicit, Unknown style);


// Function: yaml_mapping_start_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0109Scc_yaml_mapping_start_event_initialize_yaml_mapping_start_event_initialize.fwd"
yaml_mapping_start_event_initialize(yaml_event_t *event,
        const yaml_char_t *anchor, const yaml_char_t *tag, int implicit,
        yaml_mapping_style_t style)
{
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_char_t *anchor_copy = NULL;
    yaml_char_t *tag_copy = NULL;

    assert(event);      /* Non-NULL event object is expected. */

    if (anchor) {
        if (!yaml_check_utf8(anchor, strlen((char *)anchor))) goto error;
        anchor_copy = yaml_strdup(anchor);
        if (!anchor_copy) goto error;
    }

    if (tag) {
        if (!yaml_check_utf8(tag, strlen((char *)tag))) goto error;
        tag_copy = yaml_strdup(tag);
        if (!tag_copy) goto error;
    }

    MAPPING_START_EVENT_INIT(*event, anchor_copy, tag_copy,
            implicit, style, mark, mark);

    return 1;

error:
    yaml_free(anchor_copy);
    yaml_free(tag_copy);

    return 0;
}


