tellraw @p {"text":"+ Raised Max Health!","color":"red"}

scoreboard players add @p dh_hp 2
execute store result storage daggerheart:temp hp double 1 run scoreboard players get @p dh_hp
function daggerheart:buttons/update_max_health with storage daggerheart:temp

damage @p 2
effect give @p instant_health 1 0 true


item replace entity @p inventory.19 with rabbit_stew[custom_name={"text":"Raise Max Health","color":"red","italic":false},custom_data={dh_button:1b,dh_raise_max_health:1b}]

kill @s