// SCC: (yaml_get_version)

void yaml_get_version(int *major, int *minor, int *patch);


// Function: yaml_get_version
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/api.c
#include ".0068Scc_yaml_get_version_yaml_get_version.fwd"
yaml_get_version(int *major, int *minor, int *patch)
{
    *major = YAML_VERSION_MAJOR;
    *minor = YAML_VERSION_MINOR;
    *patch = YAML_VERSION_PATCH;
}


