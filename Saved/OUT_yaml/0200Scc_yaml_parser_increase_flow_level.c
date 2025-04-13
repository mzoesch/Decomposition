// SCC: (yaml_parser_increase_flow_level)

#include "0004StructType_struct.yaml_simple_key_s.h"


int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_parser_increase_flow_level(Unknown *parser);


// Function: yaml_parser_increase_flow_level
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0200Scc_yaml_parser_increase_flow_level_yaml_parser_increase_flow_level.fwd"
yaml_parser_increase_flow_level(yaml_parser_t *parser)
{
    yaml_simple_key_t empty_simple_key = { 0, 0, 0, { 0, 0, 0 } };

    /* Reset the simple key on the next level. */

    if (!PUSH(parser, parser->simple_keys, empty_simple_key))
        return 0;

    /* Increase the flow level. */

    if (parser->flow_level == INT_MAX) {
        parser->error = YAML_MEMORY_ERROR;
        return 0;
    }

    parser->flow_level++;

    return 1;
}


