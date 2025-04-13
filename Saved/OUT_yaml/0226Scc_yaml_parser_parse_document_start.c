// SCC: (yaml_parser_parse_document_start)

#include "0000StructType_struct.yaml_tag_directive_s.h"
#include "0002StructType_struct.yaml_mark_s.h"


int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_parser_process_directives(Unknown *parser, Unknown *version_directive_ref, Unknown *tag_directives_start_ref, Unknown *tag_directives_end_ref);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_set_parser_error(Unknown *parser, const char *problem, Unknown problem_mark);
void yaml_free(Unknown *ptr);


int yaml_parser_parse_document_start(Unknown *parser, Unknown *event, int implicit);


// Function: yaml_parser_parse_document_start
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0226Scc_yaml_parser_parse_document_start_yaml_parser_parse_document_start.fwd"
yaml_parser_parse_document_start(yaml_parser_t *parser, yaml_event_t *event,
        int implicit)
{
    yaml_token_t *token;
    yaml_version_directive_t *version_directive = NULL;
    struct {
        yaml_tag_directive_t *start;
        yaml_tag_directive_t *end;
    } tag_directives = { NULL, NULL };

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    /* Parse extra document end indicators. */

    if (!implicit)
    {
        while (token->type == YAML_DOCUMENT_END_TOKEN) {
            SKIP_TOKEN(parser);
            token = PEEK_TOKEN(parser);
            if (!token) return 0;
        }
    }

    /* Parse an implicit document. */

    if (implicit && token->type != YAML_VERSION_DIRECTIVE_TOKEN &&
            token->type != YAML_TAG_DIRECTIVE_TOKEN &&
            token->type != YAML_DOCUMENT_START_TOKEN &&
            token->type != YAML_STREAM_END_TOKEN)
    {
        if (!yaml_parser_process_directives(parser, NULL, NULL, NULL))
            return 0;
        if (!PUSH(parser, parser->states, YAML_PARSE_DOCUMENT_END_STATE))
            return 0;
        parser->state = YAML_PARSE_BLOCK_NODE_STATE;
        DOCUMENT_START_EVENT_INIT(*event, NULL, NULL, NULL, 1,
                token->start_mark, token->start_mark);
        return 1;
    }

    /* Parse an explicit document. */

    else if (token->type != YAML_STREAM_END_TOKEN)
    {
        yaml_mark_t start_mark, end_mark;
        start_mark = token->start_mark;
        if (!yaml_parser_process_directives(parser, &version_directive,
                    &tag_directives.start, &tag_directives.end))
            return 0;
        token = PEEK_TOKEN(parser);
        if (!token) goto error;
        if (token->type != YAML_DOCUMENT_START_TOKEN) {
            yaml_parser_set_parser_error(parser,
                    "did not find expected <document start>", token->start_mark);
            goto error;
        }
        if (!PUSH(parser, parser->states, YAML_PARSE_DOCUMENT_END_STATE))
            goto error;
        parser->state = YAML_PARSE_DOCUMENT_CONTENT_STATE;
        end_mark = token->end_mark;
        DOCUMENT_START_EVENT_INIT(*event, version_directive,
                tag_directives.start, tag_directives.end, 0,
                start_mark, end_mark);
        SKIP_TOKEN(parser);
        version_directive = NULL;
        tag_directives.start = tag_directives.end = NULL;
        return 1;
    }

    /* Parse the stream end. */

    else
    {
        parser->state = YAML_PARSE_END_STATE;
        STREAM_END_EVENT_INIT(*event, token->start_mark, token->end_mark);
        SKIP_TOKEN(parser);
        return 1;
    }

error:
    yaml_free(version_directive);
    while (tag_directives.start != tag_directives.end) {
        yaml_free(tag_directives.end[-1].handle);
        yaml_free(tag_directives.end[-1].prefix);
        tag_directives.end --;
    }
    yaml_free(tag_directives.start);
    return 0;
}


