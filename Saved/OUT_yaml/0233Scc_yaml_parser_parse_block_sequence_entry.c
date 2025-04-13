// SCC: (yaml_parser_parse_block_sequence_entry)

#include "0002StructType_struct.yaml_mark_s.h"


int yaml_parser_fetch_more_tokens(Unknown *parser);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);
int yaml_parser_parse_node(Unknown *parser, Unknown *event, int block, int indentless_sequence);
int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);
int yaml_parser_set_parser_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);


int yaml_parser_parse_block_sequence_entry(Unknown *parser, Unknown *event, int first);


// Function: yaml_parser_parse_block_sequence_entry
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0233Scc_yaml_parser_parse_block_sequence_entry_yaml_parser_parse_block_sequence_entry.fwd"
yaml_parser_parse_block_sequence_entry(yaml_parser_t *parser,
        yaml_event_t *event, int first)
{
    yaml_token_t *token;

    if (first) {
        token = PEEK_TOKEN(parser);
        if (!PUSH(parser, parser->marks, token->start_mark))
            return 0;
        SKIP_TOKEN(parser);
    }

    token = PEEK_TOKEN(parser);
    if (!token) return 0;

    if (token->type == YAML_BLOCK_ENTRY_TOKEN)
    {
        yaml_mark_t mark = token->end_mark;
        SKIP_TOKEN(parser);
        token = PEEK_TOKEN(parser);
        if (!token) return 0;
        if (token->type != YAML_BLOCK_ENTRY_TOKEN &&
                token->type != YAML_BLOCK_END_TOKEN) {
            if (!PUSH(parser, parser->states,
                        YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE))
                return 0;
            return yaml_parser_parse_node(parser, event, 1, 0);
        }
        else {
            parser->state = YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE;
            return yaml_parser_process_empty_scalar(parser, event, mark);
        }
    }

    else if (token->type == YAML_BLOCK_END_TOKEN)
    {
        parser->state = POP(parser, parser->states);
        (void)POP(parser, parser->marks);
        SEQUENCE_END_EVENT_INIT(*event, token->start_mark, token->end_mark);
        SKIP_TOKEN(parser);
        return 1;
    }

    else
    {
        return yaml_parser_set_parser_error_context(parser,
                "while parsing a block collection", POP(parser, parser->marks),
                "did not find expected '-' indicator", token->start_mark);
    }
}


