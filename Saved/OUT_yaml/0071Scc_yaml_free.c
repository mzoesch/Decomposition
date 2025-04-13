// SCC: (yaml_free)

void yaml_free(Unknown *ptr);


// Function: yaml_free
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0071Scc_yaml_free_yaml_free.fwd"
yaml_free(void *ptr)
{
    if (ptr) free(ptr);
}


