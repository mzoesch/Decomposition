// SCC: (yaml_string_extend)

void yaml_realloc(Unknown *ptr, unsigned long size);


int yaml_string_extend(unsigned char *start, unsigned char *pointer, unsigned char *end);


// Function: yaml_string_extend
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0073Scc_yaml_string_extend_yaml_string_extend.fwd"
yaml_string_extend(yaml_char_t **start,
        yaml_char_t **pointer, yaml_char_t **end)
{
    yaml_char_t *new_start = (yaml_char_t *)yaml_realloc((void*)*start, (*end - *start)*2);

    if (!new_start) return 0;

    memset(new_start + (*end - *start), 0, *end - *start);

    *pointer = new_start + (*pointer - *start);
    *end = new_start + (*end - *start)*2;
    *start = new_start;

    return 1;
}


