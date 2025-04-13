// Type: struct.yaml_simple_key_s

typedef struct yaml_simple_key_s {
    /** Is a simple key possible? */
    int possible;

    /** Is a simple key required? */
    int required;

    /** The number of the token. */
    size_t token_number;

    /** The position mark. */
    yaml_mark_t mark;
} yaml_simple_key_t;


