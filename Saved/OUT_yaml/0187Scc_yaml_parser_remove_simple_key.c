// SCC: (yaml_parser_remove_simple_key)

int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);


int yaml_parser_remove_simple_key(Unknown *parser);


// Function: yaml_parser_remove_simple_key
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0187Scc_yaml_parser_remove_simple_key_yaml_parser_remove_simple_key.fwd"
yaml_parser_remove_simple_key(yaml_parser_t *parser)
{
    yaml_simple_key_t *simple_key = parser->simple_keys.top-1;

    if (simple_key->possible)
    {
        /* If the key is required, it is an error. */

        if (simple_key->required) {
            return yaml_parser_set_scanner_error(parser,
                    "while scanning a simple key", simple_key->mark,
                    "could not find expected ':'");
        }
    }

    /* Remove the key from the stack. */

    simple_key->possible = 0;

    return 1;
}


