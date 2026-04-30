tellraw @p {"text":"+ Raised Evasion!","color":"aqua"}
scoreboard players add @p dh_evasion 1

item replace entity @p inventory.10 with rabbit_foot[custom_name={"text":"Raise Evasion","color":"green","italic":false},custom_data={dh_button:1b,dh_raise_evasion:1b}]

kill @s

