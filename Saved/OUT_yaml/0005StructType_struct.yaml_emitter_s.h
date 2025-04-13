// Type: struct.yaml_emitter_s

typedef struct yaml_emitter_s {

    /**
     * @name Error handling
     * @{
     */

    /** Error type. */
    yaml_error_type_t error;
    /** Error description. */
    const char *problem;

    /**
     * @}


