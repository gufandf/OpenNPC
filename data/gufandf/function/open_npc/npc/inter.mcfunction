execute as @e[type=interaction,tag=npc] if data entity @s interaction at @s run function gufandf:open_npc/npc/inter_npc
advancement revoke @s only gufandf:open_npc/inter
