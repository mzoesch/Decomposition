// SCC: (yaml_parser_parse_document_end)

#include "0000StructType_struct.yaml_tag_directive_s.h"
#include "0002StructType_struct.yaml_mark_s.h"


int yaml_parser_fetch_more_tokens(Unknown *parser);
void yaml_free(Unknown *ptr);


int yaml_parser_parse_document_end(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse_document_end
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0232Scc_yaml_parser_parse_document_end_yaml_parser_parse_document_end.fwd"
yaml_parser_parse_document_end(yaml_parser_t *parser, yaml_event_t *event)
{
    yaml_token_t *token;
    yaml_mark_t start_mark, end_mark;
    int implicit = 1;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    start_mark = end_mark = token->start_mark;

    if (token->type == YAML_DOCUMENT_END_TOKEN) {
        end_mark = token->end_mark;
        SKIP_TOKEN(parser);
        implicit = 0;
    }

    while (!STACK_EMPTY(parser, parser->tag_directives)) {
        yaml_tag_directive_t tag_directive = POP(parser, parser->tag_directives);
        yaml_free(tag_directive.handle);
        yaml_free(tag_directive.prefix);
    }

    parser->state = YAML_PARSE_DOCUMENT_START_STATE;
    DOCUMENT_END_EVENT_INIT(*event, implicit, start_mark, end_mark);

    return 1;
}


