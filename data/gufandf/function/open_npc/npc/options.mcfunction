scoreboard players operation @s pid = @a[tag=open_npc_target,limit=1] pid
tag @a[tag=open_npc_target,limit=1] add chooseing
tag @a[tag=open_npc_target,limit=1] add dont_throw_item
# 保存并清空物品栏
execute as @a[tag=open_npc_target,limit=1] run function gufandf:open_npc/player/inventory/save
clear @a[tag=open_npc_target,limit=1]
# 设置选项
$data modify storage gufandf:open_npc/chat temp.contents set value $(options)
execute unless data storage gufandf:open_npc/chat temp.contents[0] run say 未设置选项

execute if data storage gufandf:open_npc/chat temp.contents[0] run function gufandf:open_npc/npc/options1 {index:0}
execute if data storage gufandf:open_npc/chat temp.contents[1] run function gufandf:open_npc/npc/options1 {index:1}
execute if data storage gufandf:open_npc/chat temp.contents[2] run function gufandf:open_npc/npc/options1 {index:2}
execute if data storage gufandf:open_npc/chat temp.contents[3] run function gufandf:open_npc/npc/options1 {index:3}
execute if data storage gufandf:open_npc/chat temp.contents[4] run function gufandf:open_npc/npc/options1 {index:4}
execute if data storage gufandf:open_npc/chat temp.contents[5] run function gufandf:open_npc/npc/options1 {index:5}
execute if data storage gufandf:open_npc/chat temp.contents[6] run function gufandf:open_npc/npc/options1 {index:6}
execute if data storage gufandf:open_npc/chat temp.contents[7] run function gufandf:open_npc/npc/options1 {index:7}
execute if data storage gufandf:open_npc/chat temp.contents[8] run function gufandf:open_npc/npc/options1 {index:8}

scoreboard players remove @s open_npc_chat 1