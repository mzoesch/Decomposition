// SCC: (yaml_parser_set_parser_error)

int yaml_parser_set_parser_error(Unknown *parser, const char *problem, Unknown problem_mark);


// Function: yaml_parser_set_parser_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0222Scc_yaml_parser_set_parser_error_yaml_parser_set_parser_error.fwd"
yaml_parser_set_parser_error(yaml_parser_t *parser,
        const char *problem, yaml_mark_t problem_mark)
{
    parser->error = YAML_PARSER_ERROR;
    parser->problem = problem;
    parser->problem_mark = problem_mark;

    return 0;
}


