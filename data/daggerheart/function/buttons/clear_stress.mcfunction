# 1. Apply the actual stat logic to the player closest to the dropped item
# (You will replace this tellraw with your actual scoreboard math later!)
tellraw @p {"text":"+ Stress Cleared!","color":"aqua"}
scoreboard players remove @p dh_stress 1
execute as @p if score @s dh_stress matches ..-1 run scoreboard players set @s dh_stress 0

# 2. Put the item back into the exact same inventory slot (Slot 25 for Clear Stress)
item replace entity @p inventory.25 with feather[custom_name={"text":"Clear Stress","color":"aqua","italic":false},custom_data={dh_button:1b,dh_clear_stress:1b}]

# 3. Destroy the dropped item entity in the world so it vanishes instantly
kill @s

