tellraw @p {"text":"+ Armor Point Recovered!","color":"gray"}

# 1. Default the score to 0
scoreboard players add @p dh_armor_score 1
execute as @p if score @s dh_armor_score matches 13.. run scoreboard players set @s dh_armor_score 12

# 2. Get the current count of the item in slot 1 (If the slot is empty, this fails safely and the score stays 0)
# execute store result score @p dh_armor_score run data get entity @p Inventory[{Slot:1b}].count

# 3. Add 1 to the count (to replace the one they dropped)
# scoreboard players add @p dh_armor_score 1

# 4. Store the new count into a temporary storage for the macro
execute store result storage daggerheart:temp count int 1 run scoreboard players get @p dh_armor_score

# 5. Run the macro
function daggerheart:buttons/update_armor_score with storage daggerheart:temp

# THIS STILL NEEDS WORK
# Currently it just gaints SOME amount of durability on chestplate
# It ALSO needs to display the amount SOMEWHERE???
item modify entity @p armor.chest daggerheart:gain_armor_score


kill @s
