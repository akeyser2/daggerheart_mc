$item replace entity @p inventory.1 with iron_ingot[item_model="minecraft:chainmail_chestplate", custom_name={"text":"Recover Armor Score","color":"gray","italic":false},custom_data={dh_button:1b,dh_recover_armor_score:1b}] $(count)

$tellraw @p {"text":"+ Armor Score Updated to $(count)!","color":"dark_gray"}