// SCC: (yaml_parser_set_input_file)

void yaml_parser_set_input_file(Unknown *parser, Unknown *file);


// Function: yaml_parser_set_input_file
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0083Scc_yaml_parser_set_input_file_yaml_parser_set_input_file.fwd"
yaml_parser_set_input_file(yaml_parser_t *parser, FILE *file)
{
    assert(parser); /* Non-NULL parser object expected. */
    assert(!parser->read_handler);  /* You can set the source only once. */
    assert(file);   /* Non-NULL file object expected. */

    parser->read_handler = yaml_file_read_handler;
    parser->read_handler_data = parser;

    parser->input.file = file;
}


