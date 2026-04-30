tellraw @p {"text":"+ Armor Point Lost!","color":"dark_gray"}

item replace entity @p inventory.0 with netherite_scrap[custom_name={"text":"Spend Armor Score","color":"dark_gray","italic":false},custom_data={dh_button:1b,dh_spend_armor_score:1b}]

# 1. Default the score to 0
scoreboard players remove @p dh_armor_score 1
execute as @p if score @s dh_armor_score matches ..0 run scoreboard players set @s dh_armor_score 1

# # 2. Get the current count of the item in slot 1 (If the slot is empty, this fails safely and the score stays 0)
# execute store result score @p dh_armor_score run data get entity @p Inventory[{Slot:1b}].count

# # 3. Add 1 to the count (to replace the one they dropped)
# scoreboard players remove @p dh_armor_score 1

# 4. Store the new count into a temporary storage for the macro
execute store result storage daggerheart:temp count int 1 run scoreboard players get @p dh_armor_score

# 5. Run the macro
function daggerheart:buttons/update_armor_score with storage daggerheart:temp

# THIS STILL NEEDS WORK
# Currently it just takes SOME amount of dmg off chestplate
# It ALSO needs to display the amount SOMEWHERE???
item modify entity @p armor.chest daggerheart:use_armor_score

kill @s
