// SCC: (yaml_emitter_emit_document_end)

#include "0000StructType_struct.yaml_tag_directive_s.h"


int yaml_emitter_write_indent(Unknown *emitter);
int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_flush(Unknown *emitter);
void yaml_free(Unknown *ptr);
int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_emit_document_end(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_document_end
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0159Scc_yaml_emitter_emit_document_end_yaml_emitter_emit_document_end.fwd"
yaml_emitter_emit_document_end(yaml_emitter_t *emitter,
        yaml_event_t *event)
{
    if (event->type == YAML_DOCUMENT_END_EVENT)
    {
        if (!yaml_emitter_write_indent(emitter))
            return 0;
        if (!event->data.document_end.implicit) {
            if (!yaml_emitter_write_indicator(emitter, "...", 1, 0, 0))
                return 0;
            emitter->open_ended = 0;
            if (!yaml_emitter_write_indent(emitter))
                return 0;
        }
        else if (!emitter->open_ended)
            emitter->open_ended = 1;
        if (!yaml_emitter_flush(emitter))
            return 0;

        emitter->state = YAML_EMIT_DOCUMENT_START_STATE;

        while (!STACK_EMPTY(emitter, emitter->tag_directives)) {
            yaml_tag_directive_t tag_directive = POP(emitter,
                    emitter->tag_directives);
            yaml_free(tag_directive.handle);
            yaml_free(tag_directive.prefix);
        }

        return 1;
    }

    return yaml_emitter_set_emitter_error(emitter,
            "expected DOCUMENT-END");
}


