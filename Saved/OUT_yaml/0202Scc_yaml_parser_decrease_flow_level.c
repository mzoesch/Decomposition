// SCC: (yaml_parser_decrease_flow_level)

int yaml_parser_decrease_flow_level(Unknown *parser);


// Function: yaml_parser_decrease_flow_level
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0202Scc_yaml_parser_decrease_flow_level_yaml_parser_decrease_flow_level.fwd"
yaml_parser_decrease_flow_level(yaml_parser_t *parser)
{
    if (parser->flow_level) {
        parser->flow_level --;
        (void)POP(parser, parser->simple_keys);
    }

    return 1;
}


