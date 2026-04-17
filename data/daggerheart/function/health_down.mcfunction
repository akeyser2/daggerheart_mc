# Read current max health into our math scoreboard
execute store result score #health dh_math run attribute @s generic.max_health base get

# Subtract 2 points (1 full heart)
scoreboard players remove #health dh_math 2

# Cap it so you can't have 0 or negative health (forces a minimum of 1 heart)
execute if score #health dh_math matches ..1 run scoreboard players set #health dh_math 2

# Store it into macro memory and run the macro to apply it
execute store result storage daggerheart:macro health.amount int 1 run scoreboard players get #health dh_math
function daggerheart:set_health with storage daggerheart:macro health

# Play a damage sound
playsound minecraft:entity.player.hurt ambient @s ~ ~ ~ 1 0.8