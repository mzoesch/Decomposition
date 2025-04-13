// SCC: (yaml_parser_set_input_string)

void yaml_parser_set_input_string(Unknown *parser, const unsigned char *input, unsigned long size);


// Function: yaml_parser_set_input_string
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0081Scc_yaml_parser_set_input_string_yaml_parser_set_input_string.fwd"
yaml_parser_set_input_string(yaml_parser_t *parser,
        const unsigned char *input, size_t size)
{
    assert(parser); /* Non-NULL parser object expected. */
    assert(!parser->read_handler);  /* You can set the source only once. */
    assert(input);  /* Non-NULL input string expected. */

    parser->read_handler = yaml_string_read_handler;
    parser->read_handler_data = parser;

    parser->input.string.start = input;
    parser->input.string.current = input;
    parser->input.string.end = input+size;
}


