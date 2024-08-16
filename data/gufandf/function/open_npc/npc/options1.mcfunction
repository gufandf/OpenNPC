$data modify storage gufandf:open_npc/chat temp.content set from storage gufandf:open_npc/chat temp.contents[$(index)]
$data modify storage gufandf:open_npc/chat temp.content.optionNum set value $(index)
execute unless data storage gufandf:open_npc/chat temp.content.item run data modify storage gufandf:open_npc/chat temp.content.item set value "minecraft:firework_star"
execute unless data storage gufandf:open_npc/chat temp.content.custom_model_data run data modify storage gufandf:open_npc/chat temp.content.custom_model_data set value 0
function gufandf:open_npc/npc/options2 with storage gufandf:open_npc/chat temp.content