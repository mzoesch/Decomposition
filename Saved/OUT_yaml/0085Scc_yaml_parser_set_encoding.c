// SCC: (yaml_parser_set_encoding)

void yaml_parser_set_encoding(Unknown *parser, Unknown encoding);


// Function: yaml_parser_set_encoding
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0085Scc_yaml_parser_set_encoding_yaml_parser_set_encoding.fwd"
yaml_parser_set_encoding(yaml_parser_t *parser, yaml_encoding_t encoding)
{
    assert(parser); /* Non-NULL parser object expected. */
    assert(!parser->encoding); /* Encoding is already set or detected. */

    parser->encoding = encoding;
}


