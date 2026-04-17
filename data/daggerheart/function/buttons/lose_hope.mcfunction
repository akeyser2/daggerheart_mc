# 1. Apply the actual stat logic to the player closest to the dropped item
# (You will replace this tellraw with your actual scoreboard math later!)
tellraw @p {"text":"+ Hope Lost!","color":"dark_gray"}

# 2. Put the item back into the exact same inventory slot (Slot 25 for Clear Stress)
item replace entity @s inventory.7 with disc_fragment_5[custom_name={"text":"Lose Hope","color":"dark_gray","italic":false},custom_data={dh_button:1b,dh_lose_hope:1b}]

# 3. Destroy the dropped item entity in the world so it vanishes instantly
kill @s