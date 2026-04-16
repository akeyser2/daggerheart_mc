# Check if the player is holding the specific Daggerheart item
execute unless items entity @s weapon.mainhand *[custom_data~{daggerheart_item:1b}] run return 0

# Check if there is an armor stand very close to the player (within 5 blocks)
# We save this as a 1 or 0 to know if the player is trying to turn the ability OFF
execute store success score #temp dh_click if entity @e[type=armor_stand,tag=dh_aura,distance=..5]

# Destroy the nearest existing Daggerheart stand in a huge radius (128 blocks)
# (If the stand is destroyed here, the text display will auto-delete itself instantly!)
execute run kill @e[type=armor_stand,tag=dh_aura,distance=..128,limit=1,sort=nearest]

# If there WAS NOT a stand close by, summon a new one (Removed NoGravity:1b so it falls to the ground)
execute if score #temp dh_click matches 0 run summon armor_stand ~ ~ ~ {Tags:["dh_aura"],Invulnerable:1b,ShowArms:1b,NoBasePlate:1b}

# Instantly equip the leather armor to the newly spawned armor stand
execute if score #temp dh_click matches 0 run item replace entity @e[type=armor_stand,tag=dh_aura,distance=..5,limit=1,sort=nearest] armor.feet with minecraft:leather_boots
execute if score #temp dh_click matches 0 run item replace entity @e[type=armor_stand,tag=dh_aura,distance=..5,limit=1,sort=nearest] armor.legs with minecraft:leather_leggings
execute if score #temp dh_click matches 0 run item replace entity @e[type=armor_stand,tag=dh_aura,distance=..5,limit=1,sort=nearest] armor.chest with minecraft:leather_chestplate

# Force the armor stand to wear the head of the player who ran the command
execute if score #temp dh_click matches 0 run loot replace entity @e[type=armor_stand,tag=dh_aura,distance=..5,limit=1,sort=nearest] armor.head loot daggerheart:summoner_head

# NOW lock the armor stand's inventory so players cannot steal from it or place items on it
execute if score #temp dh_click matches 0 run data modify entity @e[type=armor_stand,tag=dh_aura,distance=..5,limit=1,sort=nearest] DisabledSlots set value 4144959

# Summon the floating text display
execute if score #temp dh_click matches 0 run summon text_display ~ ~1.2 ~ {Tags:["dh_text"],text:{text:"Close Range",color:"gold",bold:true},billboard:"center",teleport_duration:2,background:0,shadow_radius:0f}