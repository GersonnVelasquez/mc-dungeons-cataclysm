# Giant mushrooms would otherwise put the cornucopia chests on top of their caps.
fill -1326 60 -502 -1302 110 -478 minecraft:air replace minecraft:red_mushroom_block
fill -1326 60 -502 -1302 110 -478 minecraft:air replace minecraft:brown_mushroom_block
fill -1326 60 -502 -1302 110 -478 minecraft:air replace minecraft:mushroom_stem

execute positioned -1314 0 -490 positioned over motion_blocking_no_leaves run setblock ~ ~-1 ~ minecraft:gold_block
execute positioned -1314 0 -490 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1312 0 -490 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1316 0 -490 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1314 0 -488 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1314 0 -492 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1312 0 -488 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1312 0 -492 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1316 0 -488 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest
execute positioned -1316 0 -492 positioned over motion_blocking_no_leaves run setblock ~ ~ ~ minecraft:chest

summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
summon minecraft:marker -1314 70 -490 {Tags:["hambre_cofre"]}
spreadplayers -1314 -490 14 90 false @e[type=minecraft:marker,tag=hambre_cofre]
# In adventure mode nobody can climb a giant mushroom, so a chest on a cap would be unreachable.
execute as @e[type=minecraft:marker,tag=hambre_cofre] at @s if block ~ ~-1 ~ minecraft:red_mushroom_block run kill @s
execute as @e[type=minecraft:marker,tag=hambre_cofre] at @s if block ~ ~-1 ~ minecraft:brown_mushroom_block run kill @s
execute as @e[type=minecraft:marker,tag=hambre_cofre] at @s if block ~ ~-1 ~ minecraft:mushroom_stem run kill @s
execute at @e[type=minecraft:marker,tag=hambre_cofre] run setblock ~ ~ ~ minecraft:chest
kill @e[type=minecraft:marker,tag=hambre_cofre]

pvpZone add juegos_del_hambre -1414 -590 -1214 -390 8
forceload remove -1414 -590 -1214 -390
say Arena lista: cornucopia en X -1314, Z -490 y cofres repartidos por la isla.
