# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Stress Cleared!","color":"aqua"}
scoreboard players remove @p dh_stress 1
execute as @p if score @s dh_stress matches ..-1 run scoreboard players set @s dh_stress 0

item replace entity @p inventory.25 with feather[custom_name={"text":"Clear Stress","color":"aqua","italic":false},custom_data={dh_button:1b,dh_clear_stress:1b}]

kill @s

