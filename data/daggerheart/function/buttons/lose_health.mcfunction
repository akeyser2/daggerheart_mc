# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Health Lost!","color":"dark_red"}
damage @p 2

item replace entity @p inventory.16 with beetroot[custom_name={"text":"Lose Health","color":"dark_red","italic":false},custom_data={dh_button:1b,dh_lose_health:1b}]

kill @s
