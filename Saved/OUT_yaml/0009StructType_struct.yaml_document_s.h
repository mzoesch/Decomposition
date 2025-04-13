// Type: struct.yaml_document_s

typedef struct yaml_document_s {

    /** The document nodes. */
    struct {
        /** The beginning of the stack. */
        yaml_node_t *start;
        /** The end of the stack. */
        yaml_node_t *end;
        /** The top of the stack. */
        yaml_node_t *top;
    } nodes;


