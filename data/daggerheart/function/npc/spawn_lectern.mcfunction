# 1. Summon anchor exactly where the lectern goes
summon marker ~ ~2 ~ {Tags:["npc_anchor"]}

# 2. Check if a mob just spawned naturally (or is wandering right here)
tag @e[type=!player,type=!marker,type=!item,type=!painting,type=!item_frame,type=!glow_item_frame,tag=!daggerheart_npc,distance=..3,limit=1,sort=nearest] add caught_mob

# 3. IF CAUGHT: Jump straight to formatting that mob
execute if entity @e[tag=caught_mob,distance=..3] as @e[type=marker,tag=npc_anchor,distance=..3] at @s run function daggerheart:npc/visuals/format_mob
execute if entity @e[tag=caught_mob,distance=..3] run kill @e[type=marker,tag=npc_anchor,distance=..3]

# 4. IF NOT CAUGHT & HOLDING AN ITEM: Run the Dispenser Trick
execute unless entity @e[tag=caught_mob,distance=..3] unless items entity @s weapon.offhand air as @e[type=marker,tag=npc_anchor,distance=..3] at @s run function daggerheart:npc/visuals/dispenser_setup

# 5. IF NOT CAUGHT & HAND IS EMPTY: Run Armor Stand Setup
execute unless entity @e[tag=caught_mob,distance=..3] if items entity @s weapon.offhand air as @e[type=marker,tag=npc_anchor,distance=..3] at @s run function daggerheart:npc/visuals/armor_stand_setup
execute unless entity @e[tag=caught_mob,distance=..3] if items entity @s weapon.offhand air run kill @e[type=marker,tag=npc_anchor,distance=..3]