# NOTE: Making custom magic items and weapons will be 
#   VERY similar to this process. Items will be JUST name and Lore,
#   while weapons will be name, Prim/Sec|OneH/TwoH, Type|Range, Trait|Dmg Die, lore, and attribute modifiers for attack damage and attack speed.
#   damn weapons kinda suck

# 1. Save the pages into macro storage
data modify storage daggerheart:macro weapon.name set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[0].raw
data modify storage daggerheart:macro weapon.slot set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[1].raw
data modify storage daggerheart:macro weapon.burden set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[2].raw
data modify storage daggerheart:macro weapon.trait set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[3].raw
data modify storage daggerheart:macro weapon.range set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[4].raw
data modify storage daggerheart:macro weapon.dmg set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[5].raw
data modify storage daggerheart:macro weapon.dmg_type set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages[6].raw

# For the lore, we save the entire pages and remove the first 7
data modify storage daggerheart:macro book_pages set from entity @e[type=item,distance=..0.1,limit=1,sort=nearest] Item.components."minecraft:writable_book_content".pages
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]
data remove storage daggerheart:macro book_pages[0]


# 2. Save the vanilla armor's Item ID (e.g. "minecraft:iron_chestplate")
data modify storage daggerheart:macro weapon.type set from entity @s Item.id

# 3. Trigger the final Macro command
function daggerheart:create/forge_weapon with storage daggerheart:macro weapon

# 4. Play the Forge effects!
particle flame ~ ~ ~ 0.2 0.2 0.2 0.05 50
playsound block.anvil.use master @a[distance=..15] ~ ~ ~ 1 1

# 5. Destroy the original Book and Item
kill @e[type=item,distance=..0.1,limit=1,sort=nearest]
kill @s