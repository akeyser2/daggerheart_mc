# Pull the caught mob to the exact spot, freeze it, and scale it up
tp @e[tag=caught_mob,distance=..5,limit=1] ~ ~ ~
data merge entity @e[tag=caught_mob,distance=..5,limit=1] {NoAI:1b,Silent:1b,Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b}
attribute @e[tag=caught_mob,distance=..5,limit=1] generic.scale base set 1.2

# Make it an official NPC and remove the temporary tag
tag @e[tag=caught_mob,distance=..5,limit=1] add daggerheart_npc
tag @e[tag=caught_mob,distance=..5,limit=1] remove caught_mob

# Replace Dispenser/Redstone Block (or air) with the Lectern
setblock ~ ~ ~ lectern[has_book=true]{Book:{id:"minecraft:writable_book",count:1}} replace
execute if block ~ ~-1 ~ redstone_block run setblock ~ ~-1 ~ air replace

# Polish
particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.1 10 normal
playsound minecraft:block.wood.place master @a ~ ~ ~ 1 1.2
title @p actionbar {"text":"NPC Created!","color":"green"}