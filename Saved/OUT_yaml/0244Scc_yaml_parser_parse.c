// SCC: (yaml_parser_parse)

int yaml_parser_state_machine(Unknown *parser, Unknown *event);


int yaml_parser_parse(Unknown *parser, Unknown *event);


// Function: yaml_parser_parse
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0244Scc_yaml_parser_parse_yaml_parser_parse.fwd"
yaml_parser_parse(yaml_parser_t *parser, yaml_event_t *event)
{
    assert(parser);     /* Non-NULL parser object is expected. */
    assert(event);      /* Non-NULL event object is expected. */

    /* Erase the event object. */

    memset(event, 0, sizeof(yaml_event_t));

    /* No events after the end of the stream or error. */

    if (parser->stream_end_produced || parser->error ||
            parser->state == YAML_PARSE_END_STATE) {
        return 1;
    }

    /* Generate the next event. */

    return yaml_parser_state_machine(parser, event);
}


