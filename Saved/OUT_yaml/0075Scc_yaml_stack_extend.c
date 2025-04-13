// SCC: (yaml_stack_extend)

void yaml_realloc(Unknown *ptr, unsigned long size);


int yaml_stack_extend(Unknown *start, Unknown *top, Unknown *end);


// Function: yaml_stack_extend
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0075Scc_yaml_stack_extend_yaml_stack_extend.fwd"
yaml_stack_extend(void **start, void **top, void **end)
{
    void *new_start;

    if ((char *)*end - (char *)*start >= INT_MAX / 2)
	return 0;

    new_start = yaml_realloc(*start, ((char *)*end - (char *)*start)*2);

    if (!new_start) return 0;

    *top = (char *)new_start + ((char *)*top - (char *)*start);
    *end = (char *)new_start + ((char *)*end - (char *)*start)*2;
    *start = new_start;

    return 1;
}


