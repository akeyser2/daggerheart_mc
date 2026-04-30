# 1. Summon a blank item on the ground and tag it
$summon item ~ ~ ~ {Item:{id:"$(type)",count:1}, Tags:["dh_forged"]}

# 2. Overwrite its contents using the macro variables, but leave the final lore text BLANK!
# TODO: Add a new page in the book for Armor Score and replace Max Dmg with that
# I would love to have it track that as well, but idk if you can edit it on damage somehow
# Also need a new button in the UI to damage and add armor score
$item replace entity @e[type=item,tag=dh_forged,limit=1] contents with $(type)[max_damage=$(score)d,damage=1,custom_name={text:"$(name)",color:"gold",italic:false},lore=[{text:"When Worn:",color:"gray",italic:false},{text:" DMG Thresholds: $(min) / $(max)",color:"red",italic:false},{text:""},{text:"",color:"dark_gray",italic:true}],attribute_modifiers=[{id:"daggerheart:major",type:"minecraft:armor",amount:$(max)d,operation:"add_value",slot:"chest"},{id:"daggerheart:minor",type:"minecraft:armor_toughness",amount:$(min)d,operation:"add_value",slot:"chest"},],tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}]

# 3. Construct the custom GM Lore inside storage to keep the linter happy
# data modify storage daggerheart:macro new_lore set value {color:"white",italic:true}
# data modify storage daggerheart:macro new_lore.text set from storage daggerheart:macro armor.lore
# data modify storage daggerheart:macro new_lore.text set value "Test"
function daggerheart:create/append_lore



# 4. Safely append the completed lore block to the bottom of the item's lore list
# data modify entity @e[type=item,tag=dh_forged,limit=1] Item.components."minecraft:lore" append from storage daggerheart:macro new_lore
# 4. Clean up the tag
tag @e[type=item,tag=dh_forged] remove dh_forged