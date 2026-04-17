# 1. Apply the actual stat logic to the player closest to the dropped item
# (You will replace this tellraw with your actual scoreboard math later!)
tellraw @p {"text":"+ Health Gained!","color":"red"}

# 2. Put the item back into the exact same inventory slot (Slot 16 for Gain Health)
item replace entity @s inventory.17 with apple[custom_name={"text":"Gain Health","color":"red","italic":false},custom_data={dh_button:1b,dh_action:"gain_health"}]

# 3. Destroy the dropped item entity in the world so it vanishes instantly
kill @s

