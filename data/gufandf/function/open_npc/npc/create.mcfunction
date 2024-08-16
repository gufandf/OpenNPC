
$summon interaction ~ ~ ~ {Tags:["$(npc_name)","npc"],CustomName:"$(npc_name)",response:1b}
$scoreboard players set @e[nbt={Tags:["$(npc_name)"]}] open_npc_chat 0
$scoreboard players set @e[nbt={Tags:["$(npc_name)"]}] pid 0