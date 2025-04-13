// SCC: (yaml_parser_set_reader_error)

int yaml_parser_set_reader_error(Unknown *parser, const char *problem, unsigned long offset, int value);


// Function: yaml_parser_set_reader_error
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/reader.c
#include ".0180Scc_yaml_parser_set_reader_error_yaml_parser_set_reader_error.fwd"
yaml_parser_set_reader_error(yaml_parser_t *parser, const char *problem,
        size_t offset, int value)
{
    parser->error = YAML_READER_ERROR;
    parser->problem = problem;
    parser->problem_offset = offset;
    parser->problem_value = value;

    return 0;
}


