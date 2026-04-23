# 1. Give every player a unique ID and add them to the ghost team
execute as @a unless score @s dh_id matches 1.. store result score @s dh_id run scoreboard players add #global dh_id 1
team join dh_ghost @a[team=!dh_ghost]

# 2. Detect if anyone right-clicked with our item
execute as @a[scores={dh_click=1..}] at @s run function daggerheart:toggle

# 3. Reset the score immediately so it doesn't fire multiple times
scoreboard players reset @a dh_click

# 4. Make all active Daggerheart armor stands emit the flame ring
execute as @e[type=armor_stand,tag=dh_aura] at @s run function daggerheart:ring

# 5. Handle In-World Proximity Text (Matches IDs and hovers at 0.7 height)
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..150,limit=1,sort=nearest] feet as @e[type=text_display,tag=dh_melee,distance=..150] if score @s dh_id = @e[type=armor_stand,tag=dh_aura,distance=..150,limit=1,sort=nearest] dh_id run tp @s ^ ^0.7 ^2
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..150,limit=1,sort=nearest] feet as @e[type=text_display,tag=dh_vclose,distance=..150] if score @s dh_id = @e[type=armor_stand,tag=dh_aura,distance=..150,limit=1,sort=nearest] dh_id run tp @s ^ ^0.7 ^4
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..150,limit=1,sort=nearest] feet as @e[type=text_display,tag=dh_close,distance=..150] if score @s dh_id = @e[type=armor_stand,tag=dh_aura,distance=..150,limit=1,sort=nearest] dh_id run tp @s ^ ^0.7 ^8
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..150,limit=1,sort=nearest] feet as @e[type=text_display,tag=dh_far,distance=..150] if score @s dh_id = @e[type=armor_stand,tag=dh_aura,distance=..150,limit=1,sort=nearest] dh_id run tp @s ^ ^0.7 ^16
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..150,limit=1,sort=nearest] feet as @e[type=text_display,tag=dh_vfar,distance=..150] if score @s dh_id = @e[type=armor_stand,tag=dh_aura,distance=..150,limit=1,sort=nearest] dh_id run tp @s ^ ^0.7 ^32

# 6. Auto-Cleanup
execute as @e[type=text_display,tag=dh_text] at @s unless entity @e[type=armor_stand,tag=dh_aura,distance=..100] run kill @s

# --- BUTTON DETECTION ---
# Check any dropped item that hasn't been processed yet to see if it's a Daggerheart button
execute as @e[type=item,tag=!dh_processed] if items entity @s contents *[custom_data~{dh_button:1b}] run function daggerheart:buttons/check

# Initialize missing Hope and Stress scores to 0 for new players
execute as @a unless score @s dh_hope matches -100.. run scoreboard players set @s dh_hope 0
execute as @a unless score @s dh_stress matches -100.. run scoreboard players set @s dh_stress 0

# Display the Hope and Stress UI in the Actionbar above the hotbar
execute as @a run title @s actionbar [{"text":"Hope: ","color":"gold","bold":true},{"score":{"name":"*","objective":"dh_hope"},"color":"white","bold":false},{"text":"/6","color":"gray"},{"text":"   |   ","color":"dark_gray","bold":false},{"text":"Stress: ","color":"dark_purple","bold":true},{"score":{"name":"*","objective":"dh_stress"},"color":"white","bold":false},{"text":"/6","color":"gray"}]
