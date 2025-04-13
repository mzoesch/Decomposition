// SCC: (yaml_parser_set_scanner_error)

int yaml_parser_set_scanner_error(Unknown *parser, const char *context, Unknown context_mark, const char *problem);


// Function: yaml_parser_set_scanner_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/scanner.c
#include ".0178Scc_yaml_parser_set_scanner_error_yaml_parser_set_scanner_error.fwd"
yaml_parser_set_scanner_error(yaml_parser_t *parser, const char *context,
        yaml_mark_t context_mark, const char *problem)
{
    parser->error = YAML_SCANNER_ERROR;
    parser->context = context;
    parser->context_mark = context_mark;
    parser->problem = problem;
    parser->problem_mark = parser->mark;

    return 0;
}


