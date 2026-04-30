# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Health Gained!","color":"red"}
# Apparently the instant_health effect is the only way to heal a player without also giving them regeneration, so we use it to give a quick burst of healing and then immediately remove it with damage
damage @p 2
effect give @p instant_health 1 0 true

item replace entity @p inventory.17 with apple[custom_name={"text":"Gain Health","color":"red","italic":false},custom_data={dh_button:1b,dh_gain_health:1b}]

kill @s

