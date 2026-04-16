# Check up to 4 blocks above and below to find the true surface
execute if block ~ ~4 ~ #minecraft:replaceable unless block ~ ~3 ~ #minecraft:replaceable run particle flame ~ ~4.1 ~ 0 0 0 0 1
execute if block ~ ~3 ~ #minecraft:replaceable unless block ~ ~2 ~ #minecraft:replaceable run particle flame ~ ~3.1 ~ 0 0 0 0 1
execute if block ~ ~2 ~ #minecraft:replaceable unless block ~ ~1 ~ #minecraft:replaceable run particle flame ~ ~2.1 ~ 0 0 0 0 1
execute if block ~ ~1 ~ #minecraft:replaceable unless block ~ ~ ~ #minecraft:replaceable run particle flame ~ ~1.1 ~ 0 0 0 0 1
execute if block ~ ~ ~ #minecraft:replaceable unless block ~ ~-1 ~ #minecraft:replaceable run particle flame ~ ~0.1 ~ 0 0 0 0 1
execute if block ~ ~-1 ~ #minecraft:replaceable unless block ~ ~-2 ~ #minecraft:replaceable run particle flame ~ ~-0.9 ~ 0 0 0 0 1
execute if block ~ ~-2 ~ #minecraft:replaceable unless block ~ ~-3 ~ #minecraft:replaceable run particle flame ~ ~-1.9 ~ 0 0 0 0 1
execute if block ~ ~-3 ~ #minecraft:replaceable unless block ~ ~-4 ~ #minecraft:replaceable run particle flame ~ ~-2.9 ~ 0 0 0 0 1
execute if block ~ ~-4 ~ #minecraft:replaceable unless block ~ ~-5 ~ #minecraft:replaceable run particle flame ~ ~-3.9 ~ 0 0 0 0 1