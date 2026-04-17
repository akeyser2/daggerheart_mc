# Mark as processed immediately
tag @s add dh_processed

# Route to the correct action based on the specific 1b tag
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_gain_health:1b}}}}] run function daggerheart:buttons/gain_health
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_lose_health:1b}}}}] run function daggerheart:buttons/lose_health
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_clear_stress:1b}}}}] run function daggerheart:buttons/clear_stress
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_gain_stress:1b}}}}] run function daggerheart:buttons/gain_stress
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_gain_hope:1b}}}}] run function daggerheart:buttons/gain_hope
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{dh_lose_hope:1b}}}}] run function daggerheart:buttons/lose_hope