// SCC: (yaml_emitter_select_scalar_style)

int yaml_emitter_set_emitter_error(Unknown *emitter, const char *problem);


int yaml_emitter_select_scalar_style(Unknown *emitter, Unknown *event);


// Function: yaml_emitter_select_scalar_style
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/emitter.c
#include ".0142Scc_yaml_emitter_select_scalar_style_yaml_emitter_select_scalar_style.fwd"
yaml_emitter_select_scalar_style(yaml_emitter_t *emitter, yaml_event_t *event)
{
    yaml_scalar_style_t style = event->data.scalar.style;
    int no_tag = (!emitter->tag_data.handle && !emitter->tag_data.suffix);

    if (no_tag && !event->data.scalar.plain_implicit
            && !event->data.scalar.quoted_implicit) {
        return yaml_emitter_set_emitter_error(emitter,
                "neither tag nor implicit flags are specified");
    }

    if (style == YAML_ANY_SCALAR_STYLE)
        style = YAML_PLAIN_SCALAR_STYLE;

    if (emitter->canonical)
        style = YAML_DOUBLE_QUOTED_SCALAR_STYLE;

    if (emitter->simple_key_context && emitter->scalar_data.multiline)
        style = YAML_DOUBLE_QUOTED_SCALAR_STYLE;

    if (style == YAML_PLAIN_SCALAR_STYLE)
    {
        if ((emitter->flow_level && !emitter->scalar_data.flow_plain_allowed)
                || (!emitter->flow_level && !emitter->scalar_data.block_plain_allowed))
            style = YAML_SINGLE_QUOTED_SCALAR_STYLE;
        if (!emitter->scalar_data.length
                && (emitter->flow_level || emitter->simple_key_context))
            style = YAML_SINGLE_QUOTED_SCALAR_STYLE;
        if (no_tag && !event->data.scalar.plain_implicit)
            style = YAML_SINGLE_QUOTED_SCALAR_STYLE;
    }

    if (style == YAML_SINGLE_QUOTED_SCALAR_STYLE)
    {
        if (!emitter->scalar_data.single_quoted_allowed)
            style = YAML_DOUBLE_QUOTED_SCALAR_STYLE;
    }

    if (style == YAML_LITERAL_SCALAR_STYLE || style == YAML_FOLDED_SCALAR_STYLE)
    {
        if (!emitter->scalar_data.block_allowed
                || emitter->flow_level || emitter->simple_key_context)
            style = YAML_DOUBLE_QUOTED_SCALAR_STYLE;
    }

    if (no_tag && !event->data.scalar.quoted_implicit
            && style != YAML_PLAIN_SCALAR_STYLE)
    {
        emitter->tag_data.handle = (yaml_char_t *)"!";
        emitter->tag_data.handle_length = 1;
    }

    emitter->scalar_data.style = style;

    return 1;
}


