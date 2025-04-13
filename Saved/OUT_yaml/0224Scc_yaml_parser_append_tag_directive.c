// SCC: (yaml_parser_append_tag_directive)

#include "0000StructType_struct.yaml_tag_directive_s.h"


int yaml_parser_set_parser_error(Unknown *parser, const char *problem, Unknown problem_mark);
void yaml_strdup(const unsigned char *str);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_parser_append_tag_directive(Unknown *parser, Unknown value, int allow_duplicates, Unknown mark);


// Function: yaml_parser_append_tag_directive
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0224Scc_yaml_parser_append_tag_directive_yaml_parser_append_tag_directive.fwd"
yaml_parser_append_tag_directive(yaml_parser_t *parser,
        yaml_tag_directive_t value, int allow_duplicates, yaml_mark_t mark)
{
    yaml_tag_directive_t *tag_directive;
    yaml_tag_directive_t copy = { NULL, NULL };

    for (tag_directive = parser->tag_directives.start;
            tag_directive != parser->tag_directives.top; tag_directive ++) {
        if (strcmp((char *)value.handle, (char *)tag_directive->handle) == 0) {
            if (allow_duplicates)
                return 1;
            return yaml_parser_set_parser_error(parser,
                    "found duplicate %TAG directive", mark);
        }
    }

    copy.handle = yaml_strdup(value.handle);
    copy.prefix = yaml_strdup(value.prefix);
    if (!copy.handle || !copy.prefix) {
        parser->error = YAML_MEMORY_ERROR;
        goto error;
    }

    if (!PUSH(parser, parser->tag_directives, copy))
        goto error;

    return 1;

error:
    yaml_free(copy.handle);
    yaml_free(copy.prefix);
    return 0;
}


