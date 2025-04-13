// SCC: (yaml_parser_delete_aliases)

void yaml_free(Unknown *ptr);


void yaml_parser_delete_aliases(Unknown *parser);


// Function: yaml_parser_delete_aliases
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0257Scc_yaml_parser_delete_aliases_yaml_parser_delete_aliases.fwd"
yaml_parser_delete_aliases(yaml_parser_t *parser)
{
    while (!STACK_EMPTY(parser, parser->aliases)) {
        yaml_free(POP(parser, parser->aliases).anchor);
    }
    STACK_DEL(parser, parser->aliases);
}


