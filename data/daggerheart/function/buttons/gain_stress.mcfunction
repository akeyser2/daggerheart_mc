# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Stress Gained!","color":"dark_purple"}
scoreboard players add @p dh_stress 1
execute as @p if score @s dh_stress matches 7.. run scoreboard players set @s dh_stress 6

item replace entity @p inventory.26 with black_candle[custom_name={"text":"Gain Stress","color":"dark_purple","italic":false},custom_data={dh_button:1b,dh_gain_stress:1b}]

kill @s

