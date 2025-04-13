// SCC: (yaml_emitter_emit_document_start)

int yaml_emitter_analyze_version_directive(Unknown *emitter, Unknown version_directive);
int yaml_emitter_analyze_tag_directive(Unknown *emitter, Unknown tag_directive);
int yaml_emitter_append_tag_directive(Unknown *emitter, Unknown value, int allow_duplicates);
int yaml_emitter_write_indicator(Unknown *emitter, const char *indicator, int need_whitespace, int is_whitespace, int is_indention);
int yaml_emitter_write_indent(Unknown *emitter);
int yaml_emitter_write_tag_handle(Unknown *emitter, unsigned char *value, unsigned long length);
int yaml_emitter_write_tag_content(Unknown *emitter, unsigned char *value, unsigned long length, int need_whitespace);
int yaml_emitter_check_empty_document(Unknown *emitter);
int yaml_emitter_flush(Unknown *emitter);
int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_emit_document_start(Unknown *emitter, Unknown *event, int first);


// Function: yaml_emitter_emit_document_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0138Scc_yaml_emitter_emit_document_start_yaml_emitter_emit_document_start.fwd"
yaml_emitter_emit_document_start(yaml_emitter_t *emitter,
        yaml_event_t *event, int first)
{
    if (event->type == YAML_DOCUMENT_START_EVENT)
    {
        yaml_tag_directive_t default_tag_directives[] = {
            {(yaml_char_t *)"!", (yaml_char_t *)"!"},
            {(yaml_char_t *)"!!", (yaml_char_t *)"tag:yaml.org,2002:"},
            {NULL, NULL}
        };
        yaml_tag_directive_t *tag_directive;
        int implicit;

        if (event->data.document_start.version_directive) {
            if (!yaml_emitter_analyze_version_directive(emitter,
                        *event->data.document_start.version_directive))
                return 0;
        }

        for (tag_directive = event->data.document_start.tag_directives.start;
                tag_directive != event->data.document_start.tag_directives.end;
                tag_directive ++) {
            if (!yaml_emitter_analyze_tag_directive(emitter, *tag_directive))
                return 0;
            if (!yaml_emitter_append_tag_directive(emitter, *tag_directive, 0))
                return 0;
        }

        for (tag_directive = default_tag_directives;
                tag_directive->handle; tag_directive ++) {
            if (!yaml_emitter_append_tag_directive(emitter, *tag_directive, 1))
                return 0;
        }

        implicit = event->data.document_start.implicit;
        if (!first || emitter->canonical) {
            implicit = 0;
        }

        if ((event->data.document_start.version_directive ||
                    (event->data.document_start.tag_directives.start
                     != event->data.document_start.tag_directives.end)) &&
                emitter->open_ended)
        {
            if (!yaml_emitter_write_indicator(emitter, "...", 1, 0, 0))
                return 0;
            if (!yaml_emitter_write_indent(emitter))
                return 0;
        }
        emitter->open_ended = 0;

        if (event->data.document_start.version_directive) {
            implicit = 0;
            if (!yaml_emitter_write_indicator(emitter, "%YAML", 1, 0, 0))
                return 0;
            if (event->data.document_start.version_directive->minor == 1) {
                if (!yaml_emitter_write_indicator(emitter, "1.1", 1, 0, 0))
                    return 0;
            }
            else {
                if (!yaml_emitter_write_indicator(emitter, "1.2", 1, 0, 0))
                    return 0;
            }
            if (!yaml_emitter_write_indent(emitter))
                return 0;
        }

        if (event->data.document_start.tag_directives.start
                != event->data.document_start.tag_directives.end) {
            implicit = 0;
            for (tag_directive = event->data.document_start.tag_directives.start;
                    tag_directive != event->data.document_start.tag_directives.end;
                    tag_directive ++) {
                if (!yaml_emitter_write_indicator(emitter, "%TAG", 1, 0, 0))
                    return 0;
                if (!yaml_emitter_write_tag_handle(emitter, tag_directive->handle,
                            strlen((char *)tag_directive->handle)))
                    return 0;
                if (!yaml_emitter_write_tag_content(emitter, tag_directive->prefix,
                            strlen((char *)tag_directive->prefix), 1))
                    return 0;
                if (!yaml_emitter_write_indent(emitter))
                    return 0;
            }
        }

        if (yaml_emitter_check_empty_document(emitter)) {
            implicit = 0;
        }

        if (!implicit) {
            if (!yaml_emitter_write_indent(emitter))
                return 0;
            if (!yaml_emitter_write_indicator(emitter, "---", 1, 0, 0))
                return 0;
            if (emitter->canonical) {
                if (!yaml_emitter_write_indent(emitter))
                    return 0;
            }
        }

        emitter->state = YAML_EMIT_DOCUMENT_CONTENT_STATE;

        emitter->open_ended = 0;
        return 1;
    }

    else if (event->type == YAML_STREAM_END_EVENT)
    {

        /**
         * This can happen if a block scalar with trailing empty lines
         * is at the end of the stream
         */
        if (emitter->open_ended == 2)
        {
            if (!yaml_emitter_write_indicator(emitter, "...", 1, 0, 0))
                return 0;
            emitter->open_ended = 0;
            if (!yaml_emitter_write_indent(emitter))
                return 0;
        }
        if (!yaml_emitter_flush(emitter))
            return 0;

        emitter->state = YAML_EMIT_END_STATE;

        return 1;
    }

    return yaml_emitter_set_emitter_error(emitter,
            "expected DOCUMENT-START or STREAM-END");
}


