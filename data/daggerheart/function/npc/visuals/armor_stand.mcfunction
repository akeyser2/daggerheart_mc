# Summon the Armor Stand at the exact same spot as the lectern
summon armor_stand ~ ~2 ~ {Tags:["daggerheart_npc"],Marker:1b,Invisible:0b,ShowArms:1b,NoGravity:1b,Invulnerable:1b}

# Scale it up by 1.2x
attribute @e[type=armor_stand,tag=daggerheart_npc,distance=..1,limit=1] generic.scale base set 1.2