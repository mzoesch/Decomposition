// SCC: (yaml_parser_process_directives)

#include "0000StructType_struct.yaml_tag_directive_s.h"


void yaml_malloc(unsigned long size);
int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_parser_set_parser_error(Unknown *parser, const char *problem, Unknown problem_mark);
int yaml_parser_append_tag_directive(Unknown *parser, Unknown value, int allow_duplicates, Unknown mark);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
void yaml_free(Unknown *ptr);


int yaml_parser_process_directives(Unknown *parser, Unknown *version_directive_ref, Unknown *tag_directives_start_ref, Unknown *tag_directives_end_ref);


// Function: yaml_parser_process_directives
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0225Scc_yaml_parser_process_directives_yaml_parser_process_directives.fwd"
yaml_parser_process_directives(yaml_parser_t *parser,
        yaml_version_directive_t **version_directive_ref,
        yaml_tag_directive_t **tag_directives_start_ref,
        yaml_tag_directive_t **tag_directives_end_ref)
{
    yaml_tag_directive_t default_tag_directives[] = {
        {(yaml_char_t *)"!", (yaml_char_t *)"!"},
        {(yaml_char_t *)"!!", (yaml_char_t *)"tag:yaml.org,2002:"},
        {NULL, NULL}
    };
    yaml_tag_directive_t *default_tag_directive;
    yaml_version_directive_t *version_directive = NULL;
    struct {
        yaml_tag_directive_t *start;
        yaml_tag_directive_t *end;
        yaml_tag_directive_t *top;
    } tag_directives = { NULL, NULL, NULL };
    yaml_token_t *token;

    if (!STACK_INIT(parser, tag_directives, yaml_tag_directive_t*))
        goto error;

    token = PEEK_TOKEN(parser);
    if (!token) goto error;

    while (token->type == YAML_VERSION_DIRECTIVE_TOKEN ||
            token->type == YAML_TAG_DIRECTIVE_TOKEN)
    {
        if (token->type == YAML_VERSION_DIRECTIVE_TOKEN) {
            if (version_directive) {
                yaml_parser_set_parser_error(parser,
                        "found duplicate %YAML directive", token->start_mark);
                goto error;
            }
            if (token->data.version_directive.major != 1
                    || (
                        token->data.version_directive.minor != 1
                        && token->data.version_directive.minor != 2
                    )) {
                yaml_parser_set_parser_error(parser,
                        "found incompatible YAML document", token->start_mark);
                goto error;
            }
            version_directive = YAML_MALLOC_STATIC(yaml_version_directive_t);
            if (!version_directive) {
                parser->error = YAML_MEMORY_ERROR;
                goto error;
            }
            version_directive->major = token->data.version_directive.major;
            version_directive->minor = token->data.version_directive.minor;
        }

        else if (token->type == YAML_TAG_DIRECTIVE_TOKEN) {
            yaml_tag_directive_t value;
            value.handle = token->data.tag_directive.handle;
            value.prefix = token->data.tag_directive.prefix;

            if (!yaml_parser_append_tag_directive(parser, value, 0,
                        token->start_mark))
                goto error;
            if (!PUSH(parser, tag_directives, value))
                goto error;
        }

        SKIP_TOKEN(parser);
        token = PEEK_TOKEN(parser);
        if (!token) goto error;
    }

    for (default_tag_directive = default_tag_directives;
            default_tag_directive->handle; default_tag_directive++) {
        if (!yaml_parser_append_tag_directive(parser, *default_tag_directive, 1,
                    token->start_mark))
            goto error;
    }

    if (version_directive_ref) {
        *version_directive_ref = version_directive;
    }
    if (tag_directives_start_ref) {
        if (STACK_EMPTY(parser, tag_directives)) {
            *tag_directives_start_ref = *tag_directives_end_ref = NULL;
            STACK_DEL(parser, tag_directives);
        }
        else {
            *tag_directives_start_ref = tag_directives.start;
            *tag_directives_end_ref = tag_directives.top;
        }
    }
    else {
        STACK_DEL(parser, tag_directives);
    }

    if (!version_directive_ref)
        yaml_free(version_directive);
    return 1;

error:
    yaml_free(version_directive);
    while (!STACK_EMPTY(parser, tag_directives)) {
        yaml_tag_directive_t tag_directive = POP(parser, tag_directives);
        yaml_free(tag_directive.handle);
        yaml_free(tag_directive.prefix);
    }
    STACK_DEL(parser, tag_directives);
    return 0;
}


