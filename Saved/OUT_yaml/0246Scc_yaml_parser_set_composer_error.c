// SCC: (yaml_parser_set_composer_error)

int yaml_parser_set_composer_error(Unknown *parser, const char *problem, Unknown problem_mark);


// Function: yaml_parser_set_composer_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0246Scc_yaml_parser_set_composer_error_yaml_parser_set_composer_error.fwd"
yaml_parser_set_composer_error(yaml_parser_t *parser,
        const char *problem, yaml_mark_t problem_mark)
{
    parser->error = YAML_COMPOSER_ERROR;
    parser->problem = problem;
    parser->problem_mark = problem_mark;

    return 0;
}


