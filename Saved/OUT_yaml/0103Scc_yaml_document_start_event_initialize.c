// SCC: (yaml_document_start_event_initialize)

#include "0000StructType_struct.yaml_tag_directive_s.h"
#include "0002StructType_struct.yaml_mark_s.h"


void yaml_malloc(unsigned long size);
int yaml_check_utf8(const unsigned char *start, unsigned long length);
void yaml_strdup(const unsigned char *str);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_document_start_event_initialize(Unknown *event, Unknown *version_directive, Unknown *tag_directives_start, Unknown *tag_directives_end, int implicit);


// Function: yaml_document_start_event_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0103Scc_yaml_document_start_event_initialize_yaml_document_start_event_initialize.fwd"
yaml_document_start_event_initialize(yaml_event_t *event,
        yaml_version_directive_t *version_directive,
        yaml_tag_directive_t *tag_directives_start,
        yaml_tag_directive_t *tag_directives_end,
        int implicit)
{
    struct {
        yaml_error_type_t error;
    } context;
    yaml_mark_t mark = { 0, 0, 0 };
    yaml_version_directive_t *version_directive_copy = NULL;
    struct {
        yaml_tag_directive_t *start;
        yaml_tag_directive_t *end;
        yaml_tag_directive_t *top;
    } tag_directives_copy = { NULL, NULL, NULL };
    yaml_tag_directive_t value = { NULL, NULL };

    assert(event);          /* Non-NULL event object is expected. */
    assert((tag_directives_start && tag_directives_end) ||
            (tag_directives_start == tag_directives_end));
                            /* Valid tag directives are expected. */

    if (version_directive) {
        version_directive_copy = YAML_MALLOC_STATIC(yaml_version_directive_t);
        if (!version_directive_copy) goto error;
        version_directive_copy->major = version_directive->major;
        version_directive_copy->minor = version_directive->minor;
    }

    if (tag_directives_start != tag_directives_end) {
        yaml_tag_directive_t *tag_directive;
        if (!STACK_INIT(&context, tag_directives_copy, yaml_tag_directive_t*))
            goto error;
        for (tag_directive = tag_directives_start;
                tag_directive != tag_directives_end; tag_directive ++) {
            assert(tag_directive->handle);
            assert(tag_directive->prefix);
            if (!yaml_check_utf8(tag_directive->handle,
                        strlen((char *)tag_directive->handle)))
                goto error;
            if (!yaml_check_utf8(tag_directive->prefix,
                        strlen((char *)tag_directive->prefix)))
                goto error;
            value.handle = yaml_strdup(tag_directive->handle);
            value.prefix = yaml_strdup(tag_directive->prefix);
            if (!value.handle || !value.prefix) goto error;
            if (!PUSH(&context, tag_directives_copy, value))
                goto error;
            value.handle = NULL;
            value.prefix = NULL;
        }
    }

    DOCUMENT_START_EVENT_INIT(*event, version_directive_copy,
            tag_directives_copy.start, tag_directives_copy.top,
            implicit, mark, mark);

    return 1;

error:
    yaml_free(version_directive_copy);
    while (!STACK_EMPTY(context, tag_directives_copy)) {
        yaml_tag_directive_t value = POP(context, tag_directives_copy);
        yaml_free(value.handle);
        yaml_free(value.prefix);
    }
    STACK_DEL(context, tag_directives_copy);
    yaml_free(value.handle);
    yaml_free(value.prefix);

    return 0;
}


