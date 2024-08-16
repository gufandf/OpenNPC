
$data modify storage gufandf:open_npc/chat temp.content set from storage gufandf:open_npc/npc $(namespace)[$(chat)]
function gufandf:open_npc/npc/functions with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/chat with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/fx with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/jump_to with storage gufandf:open_npc/chat temp.content
function gufandf:open_npc/npc/options with storage gufandf:open_npc/chat temp.content
scoreboard players add @s open_npc_chat 1
tag @s add temp_open_npc_end