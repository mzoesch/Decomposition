// SCC: (yaml_parser_register_anchor)

#include "0011StructType_struct.yaml_alias_data_s.h"


void yaml_free(Unknown *ptr);
int yaml_parser_set_composer_error_context(Unknown *parser, const char *context, Unknown context_mark, const char *problem, Unknown problem_mark);
int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


int yaml_parser_register_anchor(Unknown *parser, int index, unsigned char *anchor);


// Function: yaml_parser_register_anchor
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0249Scc_yaml_parser_register_anchor_yaml_parser_register_anchor.fwd"
yaml_parser_register_anchor(yaml_parser_t *parser,
        int index, yaml_char_t *anchor)
{
    yaml_alias_data_t data;
    yaml_alias_data_t *alias_data;

    if (!anchor) return 1;

    data.anchor = anchor;
    data.index = index;
    data.mark = parser->document->nodes.start[index-1].start_mark;

    for (alias_data = parser->aliases.start;
            alias_data != parser->aliases.top; alias_data ++) {
        if (strcmp((char *)alias_data->anchor, (char *)anchor) == 0) {
            yaml_free(anchor);
            return yaml_parser_set_composer_error_context(parser,
                    "found duplicate anchor; first occurrence",
                    alias_data->mark, "second occurrence", data.mark);
        }
    }

    if (!PUSH(parser, parser->aliases, data)) {
        yaml_free(anchor);
        return 0;
    }

    return 1;
}


