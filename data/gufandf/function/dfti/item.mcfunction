execute at @a[tag=temp_origin,limit=1] run tp @s ~ ~ ~
data modify entity @s Owner set from entity @s Thrower
data modify entity @s PickupDelay set value 0
