// Type: struct.yaml_event_s

typedef struct yaml_event_s {

    /** The event type. */
    yaml_event_type_t type;

    /** The event data. */
    union {
        
        /** The stream parameters (for @c YAML_STREAM_START_EVENT). */
        struct {
            /** The document encoding. */
            yaml_encoding_t encoding;
        } stream_start;


