tellraw @p {"text":"+ Lowered Max Health!","color":"dark_red"}

scoreboard players remove @p dh_hp 2
execute store result storage daggerheart:temp hp double 1 run scoreboard players get @p dh_hp
function daggerheart:buttons/update_max_health with storage daggerheart:temp

item replace entity @p inventory.18 with bowl[custom_name={"text":"Lower Max Health","color":"dark_red","italic":false},custom_data={dh_button:1b,dh_lower_max_health:1b}]

kill @s