# 1. Detect if anyone right-clicked with our item
execute as @a[scores={dh_click=1..}] at @s run function daggerheart:toggle

# 2. Reset the score immediately so it doesn't fire multiple times
scoreboard players reset @a dh_click

# 3. Make all active Daggerheart armor stands emit the flame ring
execute as @e[type=armor_stand,tag=dh_aura] at @s run function daggerheart:ring

# 4. Handle In-World Proximity Text
# Calculate where the player is, and permanently slide the text display to the edge of the 5m ring closest to them
execute as @e[type=armor_stand,tag=dh_aura] at @s facing entity @p[distance=..10,limit=1,sort=nearest] feet run tp @e[type=text_display,tag=dh_text,distance=..8,limit=1,sort=nearest] ^ ^1.2 ^5

# 5. Auto-Cleanup
# If a text display ever finds itself without an armor stand within 8 blocks, it will instantly delete itself
execute as @e[type=text_display,tag=dh_text] at @s unless entity @e[type=armor_stand,tag=dh_aura,distance=..8] run kill @s