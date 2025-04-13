// SCC: (yaml_parser_unroll_indent)

#include "0003StructType_struct.yaml_token_s.h"


int yaml_queue_extend(Unknown *start, Unknown *head, Unknown *tail, Unknown *end);


int yaml_parser_unroll_indent(Unknown *parser, long column);


// Function: yaml_parser_unroll_indent
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0186Scc_yaml_parser_unroll_indent_yaml_parser_unroll_indent.fwd"
yaml_parser_unroll_indent(yaml_parser_t *parser, ptrdiff_t column)
{
    yaml_token_t token;

    /* In the flow context, do nothing. */

    if (parser->flow_level)
        return 1;

    /* Loop through the indentation levels in the stack. */

    while (parser->indent > column)
    {
        /* Create a token and append it to the queue. */

        TOKEN_INIT(token, YAML_BLOCK_END_TOKEN, parser->mark, parser->mark);

        if (!ENQUEUE(parser, parser->tokens, token))
            return 0;

        /* Pop the indentation level. */

        parser->indent = POP(parser, parser->indents);
    }

    return 1;
}


