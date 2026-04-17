# 1. Update the current angle in our temporary storage data
execute store result storage daggerheart:macro ring.angle int 1 run scoreboard players get #angle dh_math

# 2. Spawn the particle using the data currently in storage
function daggerheart:spawn_particle with storage daggerheart:macro ring

# 3. Add our step density to the angle
scoreboard players operation #angle dh_math += #step dh_math

# 4. If we haven't hit 360 degrees yet, loop this file again!
execute if score #angle dh_math matches ..359 run function daggerheart:loop_ring