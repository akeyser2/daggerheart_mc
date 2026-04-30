tellraw @p {"text":"+ Lowered Evasion!","color":"dark_green"}
scoreboard players remove @p dh_evasion 1

item replace entity @p inventory.9 with slime_ball[custom_name={"text":"Lower Evasion","color":"dark_green","italic":false},custom_data={dh_button:1b,dh_lower_evasion:1b}]

kill @s

