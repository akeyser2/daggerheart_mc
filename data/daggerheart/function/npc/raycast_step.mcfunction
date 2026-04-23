# If we hit a solid block (not air/water/etc), place the lectern!
execute unless block ~ ~ ~ #minecraft:replaceable run function daggerheart:npc/spawn_lectern

# If we are still in the air, move forward 0.5 blocks and repeat this file
# (We also limit it so it doesn't go on forever if you click at the sky)
execute if block ~ ~ ~ #minecraft:replaceable positioned ^ ^ ^0.5 run function daggerheart:npc/raycast_step