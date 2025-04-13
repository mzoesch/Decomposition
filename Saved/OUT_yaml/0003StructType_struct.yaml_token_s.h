// Type: struct.yaml_token_s

typedef struct yaml_token_s {

    /** The token type. */
    yaml_token_type_t type;

    /** The token data. */
    union {

        /** The stream start (for @c YAML_STREAM_START_TOKEN). */
        struct {
            /** The stream encoding. */
            yaml_encoding_t encoding;
        } stream_start;


