# 1. Apply the actual stat logic to the player closest to the dropped item
# (You will replace this tellraw with your actual scoreboard math later!)
tellraw @p {"text":"+ Stress Gained!","color":"dark_purple"}

# 2. Put the item back into the exact same inventory slot (Slot 26 for Gain Stress)
item replace entity @s inventory.26 with black_candle[custom_name={"text":"Gain Stress","color":"dark_purple","italic":false},custom_data={dh_button:1b,dh_action:"gain_stress"}]

# 3. Destroy the dropped item entity in the world so it vanishes instantly
kill @s

