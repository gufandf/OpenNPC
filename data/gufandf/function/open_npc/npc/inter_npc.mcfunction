tag @s remove temp_end
tag @s add temp_npc
execute on target run tag @s add temp_target

data remove storage gufandf:open_npc/functions temp_option
data remove storage gufandf:open_npc/functions temp_function
data remove storage gufandf:open_npc/npc temp_npc
data remove storage gufandf:open_npc/chat temp

execute store result storage gufandf:open_npc/chat temp.chat int 1 run scoreboard players get @s open_npc_chat
data modify storage gufandf:open_npc/chat temp.namespace set from entity @s CustomName

execute as @a if score @s pid = @a[tag=temp_npc,limit=1] pid
# execute if data storage gufandf:open_npc/chat temp.content.options run scoreboard players remove @s open_npc_chat 1

# temp_end 的作用：防止一个tick内的更改导致动作连续进行
execute unless entity @s[tag=temp_end] unless score @s pid = @a[tag=temp_target,limit=1] pid unless score @s pid matches 0..0 run function gufandf:open_npc/npc/occupied
execute unless entity @s[tag=temp_end] if score @s pid matches 0..0 run function gufandf:open_npc/npc/response with storage gufandf:open_npc/chat temp
execute unless entity @s[tag=temp_end] if score @s pid = @a[tag=temp_target,limit=1] pid run function gufandf:open_npc/npc/select_option with storage gufandf:open_npc/chat temp

tag @e[tag=temp_npc] remove temp_npc
tag @a remove temp_target
tag @s remove temp_end
data remove entity @s interaction