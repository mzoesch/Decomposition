// SCC: (yaml_emitter_anchor_node)

void yaml_emitter_anchor_node(Unknown *emitter, int index);


// Function: yaml_emitter_anchor_node
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/005_libyaml/src/dumper.c
#include ".0172Scc_yaml_emitter_anchor_node_yaml_emitter_anchor_node.fwd"
yaml_emitter_anchor_node(yaml_emitter_t *emitter, int index)
{
    yaml_node_t *node = emitter->document->nodes.start + index - 1;
    yaml_node_item_t *item;
    yaml_node_pair_t *pair;

    emitter->anchors[index-1].references ++;

    if (emitter->anchors[index-1].references == 1) {
        switch (node->type) {
            case YAML_SEQUENCE_NODE:
                for (item = node->data.sequence.items.start;
                        item < node->data.sequence.items.top; item ++) {
                    yaml_emitter_anchor_node(emitter, *item);
                }
                break;
            case YAML_MAPPING_NODE:
                for (pair = node->data.mapping.pairs.start;
                        pair < node->data.mapping.pairs.top; pair ++) {
                    yaml_emitter_anchor_node(emitter, pair->key);
                    yaml_emitter_anchor_node(emitter, pair->value);
                }
                break;
            default:
                break;
        }
    }

    else if (emitter->anchors[index-1].references == 2) {
        emitter->anchors[index-1].anchor = (++ emitter->last_anchor_id);
    }
}


