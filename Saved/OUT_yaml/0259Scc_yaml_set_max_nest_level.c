// SCC: (yaml_set_max_nest_level)

extern int MAX_NESTING_LEVEL;


void yaml_set_max_nest_level(int max);


// Function: yaml_set_max_nest_level
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/parser.c
#include ".0259Scc_yaml_set_max_nest_level_yaml_set_max_nest_level.fwd"
yaml_set_max_nest_level(int max)
{
    MAX_NESTING_LEVEL = max;
}


