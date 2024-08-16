tag @s add temp_item_save_player
execute as @e[tag=open_npc_itme] if score @s pid = @a[tag=temp_item_save_player,limit=1] pid run kill @s
summon chest_minecart ~ -65 ~ {NoGravity:1b,Invulnerable:1b,Tags:["temp_open_npc_itme1","open_npc_itme1","open_npc_itme"]}
summon chest_minecart ~ -65 ~ {NoGravity:1b,Invulnerable:1b,Tags:["temp_open_npc_itme2","open_npc_itme2","open_npc_itme"]}

execute as @e[tag=temp_open_npc_itme1] run function gufandf:open_npc/player/zzz/chest1_save
execute as @e[tag=temp_open_npc_itme2] run function gufandf:open_npc/player/zzz/chest2_save

tag @e remove temp_open_npc_itme1
tag @e remove temp_open_npc_itme2
tag @s remove temp_item_save_player