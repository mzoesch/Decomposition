// Type: struct.yaml_anchors_s

typedef struct yaml_anchors_s {
    /** The number of references. */
    int references;
    /** The anchor id. */
    int anchor;
    /** If the node has been emitted? */
    int serialized;
} yaml_anchors_t;


