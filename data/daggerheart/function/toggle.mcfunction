# 1. Check if the player is holding the specific Daggerheart item
execute unless items entity @s weapon.mainhand *[custom_data~{daggerheart_item:1b}] run return 0

# 2. Store the current player's ID in a temporary variable so we can safely compare it
scoreboard players operation #current_player dh_id = @s dh_id

# 3. Check if THIS PLAYER has an armor stand within 5 blocks (Store 1 if true, 0 if false)
scoreboard players set #temp dh_click 0
execute as @e[type=armor_stand,tag=dh_aura,distance=..5] if score @s dh_id = #current_player dh_id run scoreboard players set #temp dh_click 1

# 4. Destroy THIS PLAYER'S existing Daggerheart stand ANYWHERE in the world (Auto-cleans the text too!)
execute as @e[type=armor_stand,tag=dh_aura] if score @s dh_id = #current_player dh_id run kill @s

# 5. If they clicked within 5 blocks of their stand, they wanted to turn it OFF. Stop here!
execute if score #temp dh_click matches 1 run return 0

# 6. Otherwise, they want to turn it ON! Summon a new one
summon armor_stand ~ ~ ~ {Tags:["dh_aura","dh_new"],Invisible:1b,Invulnerable:1b,ShowArms:1b,NoBasePlate:1b,Small:1b}

# Instantly snap the new armor stand's rotation to match the direction the player is facing
tp @e[type=armor_stand,tag=dh_new,limit=1] ~ ~ ~ ~ 0

# 7. Equip the armor to the newly spawned stand
item replace entity @e[type=armor_stand,tag=dh_new,limit=1] armor.feet with minecraft:leather_boots
item replace entity @e[type=armor_stand,tag=dh_new,limit=1] armor.legs with minecraft:leather_leggings
item replace entity @e[type=armor_stand,tag=dh_new,limit=1] armor.chest with minecraft:leather_chestplate
loot replace entity @e[type=armor_stand,tag=dh_new,limit=1] armor.head loot daggerheart:summoner_head
data modify entity @e[type=armor_stand,tag=dh_new,limit=1] DisabledSlots set value 4144959

# 8. Summon the 5 floating text displays, scaled down to 50% size
summon text_display ~ ~0.7 ~ {Tags:["dh_text","dh_melee","dh_new"],text:{text:"Melee",color:"red",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f,transformation:{scale:[0.5f,0.5f,0.5f]}}
summon text_display ~ ~0.7 ~ {Tags:["dh_text","dh_vclose","dh_new"],text:{text:"Very Close",color:"gold",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f,transformation:{scale:[0.5f,0.5f,0.5f]}}
summon text_display ~ ~0.7 ~ {Tags:["dh_text","dh_close","dh_new"],text:{text:"Close",color:"yellow",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f,transformation:{scale:[0.5f,0.5f,0.5f]}}
summon text_display ~ ~0.7 ~ {Tags:["dh_text","dh_far","dh_new"],text:{text:"Far",color:"green",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f,transformation:{scale:[0.5f,0.5f,0.5f]}}
summon text_display ~ ~0.7 ~ {Tags:["dh_text","dh_vfar","dh_new"],text:{text:"Very Far",color:"blue",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f,transformation:{scale:[0.5f,0.5f,0.5f]}}

# 9. Assign the player's unique ID to the new stand and ALL 5 texts so they permanently "own" them
scoreboard players operation @e[tag=dh_new] dh_id = #current_player dh_id

# 10. Add the new armor stand to the ghost team to activate the transparency effect
team join dh_ghost @e[type=armor_stand,tag=dh_new]

# 11. Remove the "new" tags so they are ready for the background loop
tag @e[tag=dh_new] remove dh_new