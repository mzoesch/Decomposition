// SCC: (yaml_emitter_analyze_event)

int yaml_emitter_analyze_anchor(Unknown *emitter, unsigned char *anchor, int alias);
int yaml_emitter_analyze_tag(Unknown *emitter, unsigned char *tag);
int yaml_emitter_analyze_scalar(Unknown *emitter, unsigned char *value, unsigned long length);


int yaml_emitter_analyze_event(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_analyze_event
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0125Scc_yaml_emitter_analyze_event_yaml_emitter_analyze_event.fwd"
yaml_emitter_analyze_event(yaml_emitter_t *emitter,
        yaml_event_t *event)
{
    emitter->anchor_data.anchor = NULL;
    emitter->anchor_data.anchor_length = 0;
    emitter->tag_data.handle = NULL;
    emitter->tag_data.handle_length = 0;
    emitter->tag_data.suffix = NULL;
    emitter->tag_data.suffix_length = 0;
    emitter->scalar_data.value = NULL;
    emitter->scalar_data.length = 0;

    switch (event->type)
    {
        case YAML_ALIAS_EVENT:
            if (!yaml_emitter_analyze_anchor(emitter,
                        event->data.alias.anchor, 1))
                return 0;
            return 1;

        case YAML_SCALAR_EVENT:
            if (event->data.scalar.anchor) {
                if (!yaml_emitter_analyze_anchor(emitter,
                            event->data.scalar.anchor, 0))
                    return 0;
            }
            if (event->data.scalar.tag && (emitter->canonical ||
                        (!event->data.scalar.plain_implicit
                         && !event->data.scalar.quoted_implicit))) {
                if (!yaml_emitter_analyze_tag(emitter, event->data.scalar.tag))
                    return 0;
            }
            if (!yaml_emitter_analyze_scalar(emitter,
                        event->data.scalar.value, event->data.scalar.length))
                return 0;
            return 1;

        case YAML_SEQUENCE_START_EVENT:
            if (event->data.sequence_start.anchor) {
                if (!yaml_emitter_analyze_anchor(emitter,
                            event->data.sequence_start.anchor, 0))
                    return 0;
            }
            if (event->data.sequence_start.tag && (emitter->canonical ||
                        !event->data.sequence_start.implicit)) {
                if (!yaml_emitter_analyze_tag(emitter,
                            event->data.sequence_start.tag))
                    return 0;
            }
            return 1;

        case YAML_MAPPING_START_EVENT:
            if (event->data.mapping_start.anchor) {
                if (!yaml_emitter_analyze_anchor(emitter,
                            event->data.mapping_start.anchor, 0))
                    return 0;
            }
            if (event->data.mapping_start.tag && (emitter->canonical ||
                        !event->data.mapping_start.implicit)) {
                if (!yaml_emitter_analyze_tag(emitter,
                            event->data.mapping_start.tag))
                    return 0;
            }
            return 1;

        default:
            return 1;
    }
}


