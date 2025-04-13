// SCC: (yaml_parser_set_input)

void yaml_parser_set_input(Unknown *parser, Unknown *handler, Unknown *data);


// Function: yaml_parser_set_input
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0084Scc_yaml_parser_set_input_yaml_parser_set_input.fwd"
yaml_parser_set_input(yaml_parser_t *parser,
        yaml_read_handler_t *handler, void *data)
{
    assert(parser); /* Non-NULL parser object expected. */
    assert(!parser->read_handler);  /* You can set the source only once. */
    assert(handler);    /* Non-NULL read handler expected. */

    parser->read_handler = handler;
    parser->read_handler_data = data;
}


