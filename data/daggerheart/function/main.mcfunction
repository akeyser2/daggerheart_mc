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

# Initialize missing scores to default values for new players
execute as @a unless score @s dh_hope matches -100.. run scoreboard players set @s dh_hope 0
execute as @a unless score @s dh_stress matches -100.. run scoreboard players set @s dh_stress 0
execute as @a unless score @s dh_evasion matches -100.. run scoreboard players set @s dh_evasion 15
execute as @a unless score @s dh_min_threshold matches -100.. run scoreboard players set @s dh_min_threshold 0
execute as @a unless score @s dh_maj_threshold matches -100.. run scoreboard players set @s dh_maj_threshold 0

# Read the player's Armor Toughness (Minor Threshold) and base Armor (Major Threshold)
execute as @a store result score @s dh_min_threshold run attribute @s minecraft:armor_toughness get
execute as @a store result score @s dh_maj_threshold run attribute @s minecraft:armor get
# Display the Actionbar UI (Evasion, DMG Thresholds, Hope, and Stress)
# execute as @a run title @s actionbar [{"text":"Evasion: ","color":"aqua","bold":true},{"score":{"name":"*","objective":"dh_evasion"},"color":"white","bold":false},{"text":"   |   ","color":"dark_gray","bold":false},{"text":"DMG Thresholds: ","color":"red","bold":true},{"score":{"name":"*","objective":"dh_minor_threshold"},"color":"white","bold":false},{"text":"/","color":"gray"},{"score":{"name":"*","objective":"dh_major_threshold"},"color":"white","bold":false},{"text":"   |   ","color":"dark_gray","bold":false}, {"text":"Stress: ","color":"dark_purple","bold":true},{"score":{"name":"*","objective":"dh_stress"},"color":"white","bold":false},{"text":"/6","color":"gray"}, {"text":"   |   ","color":"dark_gray","bold":false},{"text":"Hope: ","color":"gold","bold":true},{"score":{"name":"*","objective":"dh_hope"},"color":"white","bold":false},{"text":"/6","color":"gray"}]
execute as @a run title @s actionbar [{"text":"Evasion: ","color":"aqua","bold":true},{"score":{"name":"*","objective":"dh_evasion"},"color":"white","bold":false},{"text":"   |   ","color":"dark_gray","bold":false},{"text":"DMG Thresholds: ","color":"red","bold":true},{"score":{"name":"*","objective":"dh_min_threshold"},"color":"white","bold":false},{"text":"/","color":"gray"},{"score":{"name":"*","objective":"dh_maj_threshold"},"color":"white","bold":false},{"text":"   |   ","color":"dark_gray","bold":false}, {"text":"Stress: ","color":"dark_purple","bold":true},{"score":{"name":"*","objective":"dh_stress"},"color":"white","bold":false},{"text":"/6","color":"gray"}, {"text":"   |   ","color":"dark_gray","bold":false},{"text":"Hope: ","color":"gold","bold":true},{"score":{"name":"*","objective":"dh_hope"},"color":"white","bold":false},{"text":"/6","color":"gray"}]
# NPC Stuff
# 1. Check for ANY newly spawned living mob within 6 blocks of a GM holding the NPC Stick
execute as @a if items entity @s weapon.offhand *[custom_data~{npc_stick:1b}] at @s as @e[tag=!old_mob,distance=..6] if data entity @s Health at @s run function daggerheart:npc/format_npc

# 2. Instantly tag all new entities globally as "old_mob" so they are never processed again
execute as @e[tag=!old_mob] run tag @s add old_mob

