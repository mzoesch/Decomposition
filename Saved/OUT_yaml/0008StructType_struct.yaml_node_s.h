// Type: struct.yaml_node_s

struct yaml_node_s {

    /** The node type. */
    yaml_node_type_t type;

    /** The node tag. */
    yaml_char_t *tag;

    /** The node data. */
    union {
        
        /** The scalar parameters (for @c YAML_SCALAR_NODE). */
        struct {
            /** The scalar value. */
            yaml_char_t *value;
            /** The length of the scalar value. */
            size_t length;
            /** The scalar style. */
            yaml_scalar_style_t style;
        } scalar;


