# Read current max health into our math scoreboard
execute store result score #health dh_math run attribute @s generic.max_health base get

# Add 2 points (1 full heart)
scoreboard players add #health dh_math 2

# Store it into macro memory and run the macro to apply it
execute store result storage daggerheart:macro health.amount int 1 run scoreboard players get #health dh_math
function daggerheart:set_health with storage daggerheart:macro health

# Heal the player instantly so the new heart fills up, and play a sound!
effect give @s instant_health 1 0 true
playsound minecraft:entity.player.levelup ambient @s ~ ~ ~ 1 2