// SCC: (yaml_emitter_emit_stream_start)

int yaml_emitter_write_bom(Unknown *emitter);
int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_emit_stream_start(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_emit_stream_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0129Scc_yaml_emitter_emit_stream_start_yaml_emitter_emit_stream_start.fwd"
yaml_emitter_emit_stream_start(yaml_emitter_t *emitter,
        yaml_event_t *event)
{
    emitter->open_ended = 0;
    if (event->type == YAML_STREAM_START_EVENT)
    {
        if (!emitter->encoding) {
            emitter->encoding = event->data.stream_start.encoding;
        }

        if (!emitter->encoding) {
            emitter->encoding = YAML_UTF8_ENCODING;
        }

        if (emitter->best_indent < 2 || emitter->best_indent > 9) {
            emitter->best_indent  = 2;
        }

        if (emitter->best_width >= 0
                && emitter->best_width <= emitter->best_indent*2) {
            emitter->best_width = 80;
        }

        if (emitter->best_width < 0) {
            emitter->best_width = INT_MAX;
        }

        if (!emitter->line_break) {
            emitter->line_break = YAML_LN_BREAK;
        }

        emitter->indent = -1;

        emitter->line = 0;
        emitter->column = 0;
        emitter->whitespace = 1;
        emitter->indention = 1;

        if (emitter->encoding != YAML_UTF8_ENCODING) {
            if (!yaml_emitter_write_bom(emitter))
                return 0;
        }

        emitter->state = YAML_EMIT_FIRST_DOCUMENT_START_STATE;

        return 1;
    }

    return yaml_emitter_set_emitter_error(emitter,
            "expected STREAM-START");
}


