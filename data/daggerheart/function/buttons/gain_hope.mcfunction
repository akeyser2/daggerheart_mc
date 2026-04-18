# 1. Apply the actual stat logic to the player closest to the dropped item
# (You will replace this tellraw with your actual scoreboard math later!)
tellraw @p {"text":"+ Hope Gained!","color":"gold"}
scoreboard players add @p dh_hope 1
execute as @p if score @s dh_hope matches 7.. run scoreboard players set @s dh_hope 6

# 2. Put the item back into the exact same inventory slot (Slot 35 for Gain Hope)
item replace entity @p inventory.8 with sunflower[custom_name={"text":"Gain Hope","color":"gold","italic":false},custom_data={dh_button:1b,dh_gain_hope:1b}]

# 3. Destroy the dropped item entity in the world so it vanishes instantly
kill @s

