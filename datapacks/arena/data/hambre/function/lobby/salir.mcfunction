execute in minecraft:overworld run tp @s 9.5 133 0.5
# The lobby switches players to adventure mode and nothing switches them back.
gamemode survival @s
pvpFlag off
tellraw @s {"text":"Volviste al mundo normal.","color":"green"}
