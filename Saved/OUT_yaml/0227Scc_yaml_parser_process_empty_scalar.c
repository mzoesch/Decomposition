// SCC: (yaml_parser_process_empty_scalar)

void yaml_malloc(unsigned long size);


int yaml_parser_process_empty_scalar(Unknown *parser, Unknown *event, Unknown mark);


// Function: yaml_parser_process_empty_scalar
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0227Scc_yaml_parser_process_empty_scalar_yaml_parser_process_empty_scalar.fwd"
yaml_parser_process_empty_scalar(yaml_parser_t *parser, yaml_event_t *event,
        yaml_mark_t mark)
{
    yaml_char_t *value;

    value = YAML_MALLOC(1);
    if (!value) {
        parser->error = YAML_MEMORY_ERROR;
        return 0;
    }
    value[0] = '\0';

    SCALAR_EVENT_INIT(*event, NULL, NULL, value, 0,
            1, 0, YAML_PLAIN_SCALAR_STYLE, mark, mark);

    return 1;
}


