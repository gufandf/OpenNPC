tag @s remove temp_open_npc_end
tag @s add open_npc_npc
execute on target run tag @s add open_npc_target

data remove storage gufandf:open_npc/functions temp_option
data remove storage gufandf:open_npc/functions temp_function
data remove storage gufandf:open_npc/npc open_npc_npc
data remove storage gufandf:open_npc/chat temp

execute store result storage gufandf:open_npc/chat temp.chat int 1 run scoreboard players get @s open_npc_chat
data modify storage gufandf:open_npc/chat temp.namespace set from entity @s CustomName

execute as @a if score @s pid = @a[tag=open_npc_npc,limit=1] pid
# execute if data storage gufandf:open_npc/chat temp.content.options run scoreboard players remove @s open_npc_chat 1

# temp_open_npc_end 的作用：防止一个tick内的更改导致动作连续进行
execute unless entity @s[tag=temp_open_npc_end] unless score @s pid = @a[tag=open_npc_target,limit=1] pid unless score @s pid matches 0..0 run function gufandf:open_npc/npc/occupied
execute unless entity @s[tag=temp_open_npc_end] if score @s pid matches 0..0 run function gufandf:open_npc/npc/response with storage gufandf:open_npc/chat temp
execute unless entity @s[tag=temp_open_npc_end] if score @s pid = @a[tag=open_npc_target,limit=1] pid run function gufandf:open_npc/npc/select_option with storage gufandf:open_npc/chat temp

tag @e[tag=open_npc_npc] remove open_npc_npc
tag @a remove open_npc_target
tag @s remove temp_open_npc_end
data remove entity @s interaction