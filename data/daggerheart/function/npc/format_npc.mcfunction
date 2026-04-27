# 1. Freeze the newly spawned mob and scale it up
data merge entity @s {NoAI:1b,Silent:1b,Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b}
attribute @s generic.scale base set 1.2
tag @s add daggerheart_npc

# 2. Place the Lectern EXACTLY where the mob spawned
setblock ~ ~ ~ lectern[has_book=true]{book:{id:"minecraft:writable_book",count:1}} replace

# 3. Add visual flair
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 20 normal
playsound minecraft:block.wood.place master @a ~ ~ ~ 1 1.2
title @p actionbar {"text":"NPC Created!","color":"green"}