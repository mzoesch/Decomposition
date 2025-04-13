// SCC: (yaml_parser_initialize)

void yaml_malloc(unsigned long size);
void yaml_free(Unknown *ptr);


int yaml_parser_initialize(Unknown *parser);


// Function: yaml_parser_initialize
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0077Scc_yaml_parser_initialize_yaml_parser_initialize.fwd"
yaml_parser_initialize(yaml_parser_t *parser)
{
    assert(parser);     /* Non-NULL parser object expected. */

    memset(parser, 0, sizeof(yaml_parser_t));
    if (!BUFFER_INIT(parser, parser->raw_buffer, INPUT_RAW_BUFFER_SIZE))
        goto error;
    if (!BUFFER_INIT(parser, parser->buffer, INPUT_BUFFER_SIZE))
        goto error;
    if (!QUEUE_INIT(parser, parser->tokens, INITIAL_QUEUE_SIZE, yaml_token_t*))
        goto error;
    if (!STACK_INIT(parser, parser->indents, int*))
        goto error;
    if (!STACK_INIT(parser, parser->simple_keys, yaml_simple_key_t*))
        goto error;
    if (!STACK_INIT(parser, parser->states, yaml_parser_state_t*))
        goto error;
    if (!STACK_INIT(parser, parser->marks, yaml_mark_t*))
        goto error;
    if (!STACK_INIT(parser, parser->tag_directives, yaml_tag_directive_t*))
        goto error;

    return 1;

error:

    BUFFER_DEL(parser, parser->raw_buffer);
    BUFFER_DEL(parser, parser->buffer);
    QUEUE_DEL(parser, parser->tokens);
    STACK_DEL(parser, parser->indents);
    STACK_DEL(parser, parser->simple_keys);
    STACK_DEL(parser, parser->states);
    STACK_DEL(parser, parser->marks);
    STACK_DEL(parser, parser->tag_directives);

    return 0;
}


