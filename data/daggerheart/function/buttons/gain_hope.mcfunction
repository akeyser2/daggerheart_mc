# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Hope Gained!","color":"gold"}
scoreboard players add @p dh_hope 1
execute as @p if score @s dh_hope matches 7.. run scoreboard players set @s dh_hope 6

item replace entity @p inventory.8 with sunflower[custom_name={"text":"Gain Hope","color":"gold","italic":false},custom_data={dh_button:1b,dh_gain_hope:1b}]

kill @s

