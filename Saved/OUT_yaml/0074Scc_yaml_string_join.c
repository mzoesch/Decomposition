// SCC: (yaml_string_join)

int yaml_string_extend(unsigned char *start, unsigned char *pointer, unsigned char *end);


int yaml_string_join(unsigned char *a_start, unsigned char *a_pointer, unsigned char *a_end, unsigned char *b_start, unsigned char *b_pointer, unsigned char *b_end);


// Function: yaml_string_join
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0074Scc_yaml_string_join_yaml_string_join.fwd"
yaml_string_join(
        yaml_char_t **a_start, yaml_char_t **a_pointer, yaml_char_t **a_end,
        yaml_char_t **b_start, yaml_char_t **b_pointer, SHIM(yaml_char_t **b_end))
{
    UNUSED_PARAM(b_end)
    if (*b_start == *b_pointer)
        return 1;

    while (*a_end - *a_pointer <= *b_pointer - *b_start) {
        if (!yaml_string_extend(a_start, a_pointer, a_end))
            return 0;
    }

    memcpy(*a_pointer, *b_start, *b_pointer - *b_start);
    *a_pointer += *b_pointer - *b_start;

    return 1;
}


