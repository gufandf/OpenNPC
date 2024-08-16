# $say "$(functions)"
$data modify storage gufandf:open_npc/functions temp_function.functions set value $(functions)
data modify storage gufandf:open_npc/functions temp_function.function set from storage gufandf:open_npc/functions temp_function.functions[0]
function gufandf:open_npc/npc/functions1 with storage gufandf:open_npc/functions temp_function
data remove storage gufandf:open_npc/functions temp_function.functions[0]
execute if data storage gufandf:open_npc/functions temp_function.functions[0] run function gufandf:open_npc/npc/functions with storage gufandf:open_npc/functions temp_function
