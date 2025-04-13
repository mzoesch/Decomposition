// SCC: (yaml_malloc)

void yaml_malloc(unsigned long size);


// Function: yaml_malloc
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0069Scc_yaml_malloc_yaml_malloc.fwd"
yaml_malloc(size_t size)
{
    return malloc(size ? size : 1);
}


