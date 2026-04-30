# 1. Summon a blank item on the ground and tag it
$tellraw @s "Summoning blank item with ID: $(type)"

$summon item ~ ~ ~ {Item:{id:"$(type)",count:1}, Tags:["dh_forged"]}

# 2. Overwrite its contents using the macro variables, but leave the final lore text BLANK!
# TODO: Fix this cause its a weapon and holy idk
$item replace entity @e[type=item,tag=dh_forged,limit=1] contents with $(type)[custom_name={text:"$(name)",color:"gold",italic:false},lore=[{text:"$(slot) | $(burden)",color:"red",italic:false},{text:"$(trait) | $(range)",color:"green",italic:false},{text:"$(dmg) | $(dmg_type)",color:"blue",italic:false},{text:"",color:"dark_gray",italic:true}]]

# 3. Construct the custom GM Lore inside storage to keep the linter happy
function daggerheart:create/append_lore



# 4. Safely append the completed lore block to the bottom of the item's lore list
# data modify entity @e[type=item,tag=dh_forged,limit=1] Item.components."minecraft:lore" append from storage daggerheart:macro new_lore
# 4. Clean up the tag
tag @e[type=item,tag=dh_forged] remove dh_forged