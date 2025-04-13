// SCC: (yaml_parser_load_alias)

void yaml_free(Unknown *ptr);
int yaml_parser_load_node_add(Unknown *parser, Unknown *ctx, int index);
int yaml_parser_set_composer_error(Unknown *parser, const char *problem, Unknown problem_mark);


int yaml_parser_load_alias(Unknown *parser, Unknown *event, Unknown *ctx);


// Function: yaml_parser_load_alias
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/loader.c
#include ".0247Scc_yaml_parser_load_alias_yaml_parser_load_alias.fwd"
yaml_parser_load_alias(yaml_parser_t *parser, yaml_event_t *event,
        struct loader_ctx *ctx)
{
    yaml_char_t *anchor = event->data.alias.anchor;
    yaml_alias_data_t *alias_data;

    for (alias_data = parser->aliases.start;
            alias_data != parser->aliases.top; alias_data ++) {
        if (strcmp((char *)alias_data->anchor, (char *)anchor) == 0) {
            yaml_free(anchor);
            return yaml_parser_load_node_add(parser, ctx, alias_data->index);
        }
    }

    yaml_free(anchor);
    return yaml_parser_set_composer_error(parser, "found undefined alias",
            event->start_mark);
}


