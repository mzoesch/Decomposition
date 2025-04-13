// SCC: (yaml_parser_parse_node)

#include "0002StructType_struct.yaml_mark_s.h"


extern int MAX_NESTING_LEVEL;


int yaml_parser_fetch_more_tokens(Unknown *parser);
void yaml_free(Unknown *ptr);
void yaml_malloc(unsigned long size);
int yaml_parser_set_parser_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);
int yaml_maximum_level_reached(Unknown *parser, Unknown context_mark, Unknown problem_mark);


int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);


// Function: yaml_parser_parse_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0230Scc_yaml_parser_parse_node_yaml_parser_parse_node.fwd"
yaml_parser_parse_node(yaml_parser_t *parser, yaml_event_t *event,
        int block, int indentless_sequence)
{
    yaml_token_t *token;
    yaml_char_t *anchor = NULL;
    yaml_char_t *tag_handle = NULL;
    yaml_char_t *tag_suffix = NULL;
    yaml_char_t *tag = NULL;
    yaml_mark_t start_mark, end_mark, tag_mark;
    int implicit;

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type == YAML_ALIAS_TOKEN)
    {
        parser->state = POP(parser, parser->states);
        ALIAS_EVENT_INIT(*event, token->data.alias.value,
                token->start_mark, token->end_mark);
        SKIP_TOKEN(parser);
        return 1;
    }

    else
    {
        start_mark = end_mark = token->start_mark;

        if (token->type == YAML_ANCHOR_TOKEN)
        {
            anchor = token->data.anchor.value;
            start_mark = token->start_mark;
            end_mark = token->end_mark;
            SKIP_TOKEN(parser);
            token = PEEK_TOKEN(parser);
            if (!token) goto error;
            if (token->type == YAML_TAG_TOKEN)
            {
                tag_handle = token->data.tag.handle;
                tag_suffix = token->data.tag.suffix;
                tag_mark = token->start_mark;
                end_mark = token->end_mark;
                SKIP_TOKEN(parser);
                token = PEEK_TOKEN(parser);
                if (!token) goto error;
            }
        }
        else if (token->type == YAML_TAG_TOKEN)
        {
            tag_handle = token->data.tag.handle;
            tag_suffix = token->data.tag.suffix;
            start_mark = tag_mark = token->start_mark;
            end_mark = token->end_mark;
            SKIP_TOKEN(parser);
            token = PEEK_TOKEN(parser);
            if (!token) goto error;
            if (token->type == YAML_ANCHOR_TOKEN)
            {
                anchor = token->data.anchor.value;
                end_mark = token->end_mark;
                SKIP_TOKEN(parser);
                token = PEEK_TOKEN(parser);
                if (!token) goto error;
            }
        }

        if (tag_handle) {
            if (!*tag_handle) {
                tag = tag_suffix;
                yaml_free(tag_handle);
                tag_handle = tag_suffix = NULL;
            }
            else {
                yaml_tag_directive_t *tag_directive;
                for (tag_directive = parser->tag_directives.start;
                        tag_directive != parser->tag_directives.top;
                        tag_directive ++) {
                    if (strcmp((char *)tag_directive->handle, (char *)tag_handle) == 0) {
                        size_t prefix_len = strlen((char *)tag_directive->prefix);
                        size_t suffix_len = strlen((char *)tag_suffix);
                        tag = YAML_MALLOC(prefix_len+suffix_len+1);
                        if (!tag) {
                            parser->error = YAML_MEMORY_ERROR;
                            goto error;
                        }
                        memcpy(tag, tag_directive->prefix, prefix_len);
                        memcpy(tag+prefix_len, tag_suffix, suffix_len);
                        tag[prefix_len+suffix_len] = '\0';
                        yaml_free(tag_handle);
                        yaml_free(tag_suffix);
                        tag_handle = tag_suffix = NULL;
                        break;
                    }
                }
                if (!tag) {
                    yaml_parser_set_parser_error_context(parser,
                            "while parsing a node", start_mark,
                            "found undefined tag handle", tag_mark);
                    goto error;
                }
            }
        }

        implicit = (!tag || !*tag);
        if (indentless_sequence && token->type == YAML_BLOCK_ENTRY_TOKEN) {
            end_mark = token->end_mark;
            parser->state = YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE;
            SEQUENCE_START_EVENT_INIT(*event, anchor, tag, implicit,
                    YAML_BLOCK_SEQUENCE_STYLE, start_mark, end_mark);
            return 1;
        }
        else {
            if (token->type == YAML_SCALAR_TOKEN) {
                int plain_implicit = 0;
                int quoted_implicit = 0;
                end_mark = token->end_mark;
                if ((token->data.scalar.style == YAML_PLAIN_SCALAR_STYLE && !tag)
                        || (tag && strcmp((char *)tag, "!") == 0)) {
                    plain_implicit = 1;
                }
                else if (!tag) {
                    quoted_implicit = 1;
                }
                parser->state = POP(parser, parser->states);
                SCALAR_EVENT_INIT(*event, anchor, tag,
                        token->data.scalar.value, token->data.scalar.length,
                        plain_implicit, quoted_implicit,
                        token->data.scalar.style, start_mark, end_mark);
                SKIP_TOKEN(parser);
                return 1;
            }
            else if (token->type == YAML_FLOW_SEQUENCE_START_TOKEN) {
                if (!STACK_LIMIT(parser, parser->indents, MAX_NESTING_LEVEL - parser->flow_level)) {
                    yaml_maximum_level_reached(parser, start_mark, token->start_mark);
                    goto error;
                }
                end_mark = token->end_mark;
                parser->state = YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE;
                SEQUENCE_START_EVENT_INIT(*event, anchor, tag, implicit,
                        YAML_FLOW_SEQUENCE_STYLE, start_mark, end_mark);
                return 1;
            }
            else if (token->type == YAML_FLOW_MAPPING_START_TOKEN) {
                if (!STACK_LIMIT(parser, parser->indents, MAX_NESTING_LEVEL - parser->flow_level)) {
                    yaml_maximum_level_reached(parser, start_mark, token->start_mark);
                    goto error;
                }
                end_mark = token->end_mark;
                parser->state = YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE;
                MAPPING_START_EVENT_INIT(*event, anchor, tag, implicit,
                        YAML_FLOW_MAPPING_STYLE, start_mark, end_mark);
                return 1;
            }
            else if (block && token->type == YAML_BLOCK_SEQUENCE_START_TOKEN) {
                if (!STACK_LIMIT(parser, parser->indents, MAX_NESTING_LEVEL - parser->flow_level)) {
                    yaml_maximum_level_reached(parser, start_mark, token->start_mark);
                    goto error;
                }
                end_mark = token->end_mark;
                parser->state = YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE;
                SEQUENCE_START_EVENT_INIT(*event, anchor, tag, implicit,
                        YAML_BLOCK_SEQUENCE_STYLE, start_mark, end_mark);
                return 1;
            }
            else if (block && token->type == YAML_BLOCK_MAPPING_START_TOKEN) {
                if (!STACK_LIMIT(parser, parser->indents, MAX_NESTING_LEVEL - parser->flow_level)) {
                    yaml_maximum_level_reached(parser, start_mark, token->start_mark);
                    goto error;
                }
                end_mark = token->end_mark;
                parser->state = YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE;
                MAPPING_START_EVENT_INIT(*event, anchor, tag, implicit,
                        YAML_BLOCK_MAPPING_STYLE, start_mark, end_mark);
                return 1;
            }
            else if (anchor || tag) {
                yaml_char_t *value = YAML_MALLOC(1);
                if (!value) {
                    parser->error = YAML_MEMORY_ERROR;
                    goto error;
                }
                value[0] = '\0';
                parser->state = POP(parser, parser->states);
                SCALAR_EVENT_INIT(*event, anchor, tag, value, 0,
                        implicit, 0, YAML_PLAIN_SCALAR_STYLE,
                        start_mark, end_mark);
                return 1;
            }
            else {
                yaml_parser_set_parser_error_context(parser,
                        (block ? "while parsing a block node"
                         : "while parsing a flow node"), start_mark,
                        "did not find expected node content", token->start_mark);
                goto error;
            }
        }
    }

error:
    yaml_free(anchor);
    yaml_free(tag_handle);
    yaml_free(tag_suffix);
    yaml_free(tag);

    return 0;
}


