# Base Case: If there are no pages left in storage, stop the loop
execute if data storage daggerheart:macro {book_pages:[]} run return 0
# tellraw @a ["Remaining pages: ", {"storage": "daggerheart:macro", "nbt": "book_pages"}]

# 1. Construct the lore line, might add custom formatting later idk
data modify storage daggerheart:macro current_line set value {color:"gray",italic:true}

# 2. Pull the next page's text into the lore line
data modify storage daggerheart:macro current_line.text set from storage daggerheart:macro book_pages[0].raw

# 3. Safely append it to the bottom of the item's lore list
data modify entity @e[type=item,tag=dh_forged,limit=1] Item.components."minecraft:lore" append from storage daggerheart:macro current_line

# 4. Delete the page we just processed so the next page slides up to the slot
data remove storage daggerheart:macro book_pages[0]

# 5. Loop!
function daggerheart:create/append_lore