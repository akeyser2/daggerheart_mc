# 1. Save the 4 pages of the Blueprint into macro storage
data modify storage daggerheart:macro armor.name set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[0].raw
data modify storage daggerheart:macro armor.min set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[1].raw
data modify storage daggerheart:macro armor.max set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[2].raw
# data modify storage daggerheart:macro armor.lore set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[3].raw
# For the lore, we save the entire pages and remove the first 3
data modify storage daggerheart:macro book_pages set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]


# 2. Save the vanilla armor's Item ID (e.g. "minecraft:iron_chestplate")
data modify storage daggerheart:macro armor.type set from entity @s Item.id

# 3. Trigger the final Macro command
function daggerheart:create/forge_armor with storage daggerheart:macro armor

# 4. Play the Forge effects!
particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 50
playsound block.anvil.use master @a[distance=..15] ~ ~ ~ 1 1

# 5. Destroy the original Book and Vanilla Armor
kill @e[type=item,distance=..0.1,limit=1,sort=nearest]
kill @s