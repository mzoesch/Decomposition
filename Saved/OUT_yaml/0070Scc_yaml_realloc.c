// SCC: (yaml_realloc)

void yaml_realloc(Unknown *ptr, unsigned long size);


// Function: yaml_realloc
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0070Scc_yaml_realloc_yaml_realloc.fwd"
yaml_realloc(void *ptr, size_t size)
{
    return ptr ? realloc(ptr, size ? size : 1) : malloc(size ? size : 1);
}


