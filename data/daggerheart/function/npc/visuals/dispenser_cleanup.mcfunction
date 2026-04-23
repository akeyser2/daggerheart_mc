# Tag any dropped items
execute as @e[type=marker,tag=npc_anchor] at @s run tag @e[type=item,distance=..2] add not_egg

# If it dropped an item, it WAS NOT a spawn egg. Run Armor Stand fallback.
execute as @e[type=marker,tag=npc_anchor] at @s if entity @e[tag=not_egg,distance=..2] run function daggerheart:npc/visuals/armor_stand_setup

# If it didn't drop an item, it WAS a spawn egg! Tag the newly spawned mob and format it.
execute as @e[type=marker,tag=npc_anchor] at @s unless entity @e[tag=not_egg,distance=..2] run tag @e[type=!player,type=!marker,type=!item,tag=!daggerheart_npc,distance=..3,limit=1,sort=nearest] add caught_mob
execute as @e[type=marker,tag=npc_anchor] at @s unless entity @e[tag=not_egg,distance=..2] run function daggerheart:npc/visuals/format_mob

# Clean up the dropped item and the anchor
execute as @e[type=marker,tag=npc_anchor] at @s run kill @e[tag=not_egg,distance=..2]
execute as @e[type=marker,tag=npc_anchor] run kill @s