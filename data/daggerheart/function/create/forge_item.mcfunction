# 1. Summon a blank item on the ground and tag it
$summon item ~ ~ ~ {Item:{id:"$(type)",count:1}, Tags:["dh_forged"]}

# 2. Overwrite its contents using the macro variables
# Also need a new button in the UI to damage and add armor score
$item replace entity @e[type=item,tag=dh_forged,limit=1] contents with $(type)[custom_name={text:"$(name)",color:"gold",italic:false},tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}]

# 3. Construct the custom GM Lore inside storage to keep the linter happy
function daggerheart:create/append_lore



# 4. Safely append the completed lore block to the bottom of the item's lore list
# data modify entity @e[type=item,tag=dh_forged,limit=1] Item.components."minecraft:lore" append from storage daggerheart:macro new_lore
# 4. Clean up the tag
tag @e[type=item,tag=dh_forged] remove dh_forged