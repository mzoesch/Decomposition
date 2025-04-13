// SCC: (yaml_maximum_level_reached)

int yaml_parser_set_parser_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);


int yaml_maximum_level_reached(Unknown *parser, Unknown context_mark, Unknown problem_mark);


// Function: yaml_maximum_level_reached
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0229Scc_yaml_maximum_level_reached_yaml_maximum_level_reached.fwd"
yaml_maximum_level_reached(yaml_parser_t *parser,
        yaml_mark_t context_mark, yaml_mark_t problem_mark)
{
    yaml_parser_set_parser_error_context(parser,
            "while parsing", context_mark, "Maximum nesting level reached, set with yaml_set_max_nest_level())", problem_mark);
    return 0;
}


