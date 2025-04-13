// SCC: (yaml_emitter_dump_alias)

#include "0002StructType_struct.yaml_mark_s.h"
#include "0006StructType_struct.yaml_event_s.h"


int yaml_emitter_emit(Unknown *emitter, Unknown *event);


int yaml_emitter_dump_alias(Unknown *emitter, unsigned char *anchor);


// Function: yaml_emitter_dump_alias
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0174Scc_yaml_emitter_dump_alias_yaml_emitter_dump_alias.fwd"
yaml_emitter_dump_alias(yaml_emitter_t *emitter, yaml_char_t *anchor)
{
    yaml_event_t event;
    yaml_mark_t mark  = { 0, 0, 0 };

    ALIAS_EVENT_INIT(event, anchor, mark, mark);

    return yaml_emitter_emit(emitter, &event);
}


