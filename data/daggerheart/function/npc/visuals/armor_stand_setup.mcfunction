# Replace Dispenser/Redstone Block (or air) with the Lectern
setblock ~ ~ ~ lectern[has_book=true]{Book:{id:"minecraft:writable_book",count:1}} replace
execute if block ~ ~-1 ~ redstone_block run setblock ~ ~-1 ~ air replace

# Summon Armor Stand
summon armor_stand ~ ~ ~ {Tags:["daggerheart_npc"],Marker:1b,Invisible:0b,ShowArms:1b,NoGravity:1b,Invulnerable:1b}
attribute @e[type=armor_stand,tag=daggerheart_npc,distance=..1,limit=1] generic.scale base set 1.2

# Polish
particle minecraft:happy_villager ~ ~0.5 ~ 0.2 0.2 0.2 0.1 10 normal
playsound minecraft:block.wood.place master @a ~ ~ ~ 1 1.2
title @p actionbar {"text":"Empty Data Book Created!","color":"yellow"}