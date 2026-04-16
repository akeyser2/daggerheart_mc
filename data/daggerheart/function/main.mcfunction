# 1. Give every player a unique ID and add them to the ghost team
execute as @a unless score @s dh_id matches 1.. store result score @s dh_id run scoreboard players add #global dh_id 1
team join dh_ghost @a[team=!dh_ghost]

# 2. Detect if anyone right-clicked with our item
execute as @a[scores={dh_click=1..}] at @s run function daggerheart:toggle

# 3. Reset the score immediately so it doesn't fire multiple times
scoreboard players reset @a dh_click

# 4. Make all active Daggerheart armor stands emit the flame ring
execute as @e[type=armor_stand,tag=dh_aura] at @s run function daggerheart:ring

# 5. Handle In-World Proximity Text
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..10,limit=1,sort=nearest] feet run tp @e[type=text_display,tag=dh_text,distance=..8,limit=1,sort=nearest] ^ ^1.2 ^5

# 6. Auto-Cleanup
execute as @e[type=text_display,tag=dh_text] at @s unless entity @e[type=armor_stand,tag=dh_aura,distance=..8] run kill @s