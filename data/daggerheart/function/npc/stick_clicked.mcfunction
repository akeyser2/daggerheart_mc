# Reset the click score immediately
scoreboard players reset @s click_npc_stick

# Make sure they are actually holding the NPC stick, then start the raycast
execute if items entity @s weapon.mainhand *[custom_data~{npc_stick:1b}] anchored eyes positioned ^ ^ ^ run function daggerheart:npc/raycast_step