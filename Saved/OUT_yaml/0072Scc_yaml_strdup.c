// SCC: (yaml_strdup)

void yaml_strdup(const unsigned char *str);


// Function: yaml_strdup
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0072Scc_yaml_strdup_yaml_strdup.fwd"
yaml_strdup(const yaml_char_t *str)
{
    if (!str)
        return NULL;

    return (yaml_char_t *)strdup((char *)str);
}


