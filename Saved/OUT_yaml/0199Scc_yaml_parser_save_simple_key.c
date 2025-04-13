// SCC: (yaml_parser_save_simple_key)

#include "0004StructType_struct.yaml_simple_key_s.h"


int yaml_parser_remove_simple_key(Unknown *parser);


int yaml_parser_save_simple_key(Unknown *parser);


// Function: yaml_parser_save_simple_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0199Scc_yaml_parser_save_simple_key_yaml_parser_save_simple_key.fwd"
yaml_parser_save_simple_key(yaml_parser_t *parser)
{
    /*
     * A simple key is required at the current position if the scanner is in
     * the block context and the current column coincides with the indentation
     * level.
     */

    int required = (!parser->flow_level
            && parser->indent == (ptrdiff_t)parser->mark.column);

    /*
     * If the current position may start a simple key, save it.
     */

    if (parser->simple_key_allowed)
    {
        yaml_simple_key_t simple_key;
        simple_key.possible = 1;
        simple_key.required = required;
        simple_key.token_number =
            parser->tokens_parsed + (parser->tokens.tail - parser->tokens.head);
        simple_key.mark = parser->mark;

        if (!yaml_parser_remove_simple_key(parser)) return 0;

        *(parser->simple_keys.top-1) = simple_key;
    }

    return 1;
}


