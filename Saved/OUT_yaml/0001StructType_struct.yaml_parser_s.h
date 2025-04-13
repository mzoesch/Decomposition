// Type: struct.yaml_parser_s

typedef struct yaml_parser_s {

    /**
     * @name Error handling
     * @{
     */

    /** Error type. */
    yaml_error_type_t error;
    /** Error description. */
    const char *problem;
    /** The byte about which the problem occurred. */
    size_t problem_offset;
    /** The problematic value (@c -1 is none). */
    int problem_value;
    /** The problem position. */
    yaml_mark_t problem_mark;
    /** The error context. */
    const char *context;
    /** The context position. */
    yaml_mark_t context_mark;

    /**
     * @}


