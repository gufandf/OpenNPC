data modify storage gufandf:open_npc/chat temp.name set from entity @s CustomName
data modify storage gufandf:open_npc/chat temp.chat_index set from storage gufandf:open_npc/chat temp.chat
# execute store result storage gufandf:open_npc/chat temp.chat_index int 1 run scoreboard players get @s open_npc_chat
data modify storage gufandf:open_npc/chat temp.option_index set from entity @a[tag=open_npc_target,limit=1] SelectedItem.components."minecraft:custom_data".option
function gufandf:open_npc/npc/select_option2 with storage gufandf:open_npc/chat temp
execute as @a[tag=open_npc_target,limit=1] run function gufandf:open_npc/player/inventory/load

# function gufandf:open_npc/npc/chat with storage gufandf:open_npc/chat temp.content
# function gufandf:open_npc/npc/functions1 with storage gufandf:open_npc/chat temp.content

function gufandf:open_npc/npc/functions with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/chat with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/fx with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/jump_to with storage gufandf:open_npc/chat temp.content


scoreboard players set @s pid 0
scoreboard players add @s open_npc_chat 1
tag @a[tag=open_npc_target,limit=1] remove chooseing
tag @a[tag=open_npc_target,limit=1] remove dont_throw_item
tag @s add temp_open_npc_end
# 多层有BUG
# function gufandf:open_npc/npc/options with storage gufandf:open_npc/chat temp.content

execute unless data storage gufandf:open_npc/chat temp.content.text run function gufandf:open_npc/npc/inter_npc