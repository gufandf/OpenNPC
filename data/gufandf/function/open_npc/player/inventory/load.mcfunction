tag @s add temp_item_load_player

execute as @e[tag=open_npc_itme1] if score @s pid = @a[tag=temp_item_load_player,limit=1] pid run function gufandf:open_npc/player/zzz/chest1_load
execute as @e[tag=open_npc_itme2] if score @s pid = @a[tag=temp_item_load_player,limit=1] pid run function gufandf:open_npc/player/zzz/chest2_load

tag @s remove temp_item_load_player