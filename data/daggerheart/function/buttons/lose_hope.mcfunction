# 1. Apply the actual stat logic to the player closest to the dropped item
tellraw @p {"text":"+ Hope Lost!","color":"dark_gray"}
scoreboard players remove @p dh_hope 1
execute as @p if score @s dh_hope matches ..-1 run scoreboard players set @s dh_hope 0

item replace entity @p inventory.7 with music_disc_11[custom_name={"text":"Lose Hope","color":"dark_gray","italic":false},custom_data={dh_button:1b,dh_lose_hope:1b},!jukebox_playable]

kill @s