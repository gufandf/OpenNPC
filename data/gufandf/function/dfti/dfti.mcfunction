tag @s add temp_item
execute on origin at @s run tag @s add temp_origin
execute if entity @a[tag=dont_throw_item] run function gufandf:dfti/item
tag @s remove temp_irem
tag @a remove temp_origin