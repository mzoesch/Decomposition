// SCC: (yaml_file_read_handler)

int yaml_file_read_handler(Unknown *data, unsigned char *buffer, unsigned long size, unsigned long *size_read);


// Function: yaml_file_read_handler
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0082Scc_yaml_file_read_handler_yaml_file_read_handler.fwd"
yaml_file_read_handler(void *data, unsigned char *buffer, size_t size,
        size_t *size_read)
{
    yaml_parser_t *parser = (yaml_parser_t *)data;

    *size_read = fread(buffer, 1, size, parser->input.file);
    return !ferror(parser->input.file);
}


