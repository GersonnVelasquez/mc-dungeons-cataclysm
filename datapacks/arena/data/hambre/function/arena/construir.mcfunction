execute in hambre:arena run fill -7 119 -307 7 119 -293 minecraft:polished_andesite
execute in hambre:arena run fill -8 119 -308 8 123 -308 minecraft:barrier
execute in hambre:arena run fill -8 119 -292 8 123 -292 minecraft:barrier
execute in hambre:arena run fill -8 119 -308 -8 123 -292 minecraft:barrier
execute in hambre:arena run fill 8 119 -308 8 123 -292 minecraft:barrier
execute in hambre:arena run setblock 0 119 -305 minecraft:gold_block
execute in hambre:arena run setblock 0 120 -305 minecraft:light_weighted_pressure_plate
execute in hambre:arena run setblock 1 120 -305 minecraft:oak_sign[rotation=0]{front_text:{messages:['"Pisa el oro"','"para volver"','"al mundo"','"normal"']}}
execute in hambre:arena run pvpZone add arena -250 -250 250 250 8
execute in hambre:arena run forceload remove all
say Arena lista: mapa Downstream convertido, lobby armado y zona PvP creada.
