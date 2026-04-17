# --- MELEE RING (1.5m, Red, 30 deg steps = 12 particles) ---
data modify storage daggerheart:macro ring.radius set value 1.5f
data modify storage daggerheart:macro ring.color set value [1.0f, 0.1f, 0.1f]
scoreboard players set #angle dh_math 0
scoreboard players set #step dh_math 30
function daggerheart:loop_ring

# --- VERY CLOSE RING (3m, Orange, 15 deg steps = 24 particles) ---
data modify storage daggerheart:macro ring.radius set value 3.0f
data modify storage daggerheart:macro ring.color set value [1.0f, 0.5f, 0.0f]
scoreboard players set #angle dh_math 0
scoreboard players set #step dh_math 15
function daggerheart:loop_ring

# --- CLOSE RING (9m, Yellow, 10 deg steps = 36 particles) ---
data modify storage daggerheart:macro ring.radius set value 9.0f
data modify storage daggerheart:macro ring.color set value [1.0f, 1.0f, 0.2f]
scoreboard players set #angle dh_math 0
scoreboard players set #step dh_math 10
function daggerheart:loop_ring

# --- FAR RING (30m, Green, 4 deg steps = 90 particles) ---
data modify storage daggerheart:macro ring.radius set value 30.0f
data modify storage daggerheart:macro ring.color set value [0.2f, 1.0f, 0.2f]
scoreboard players set #angle dh_math 0
scoreboard players set #step dh_math 4
function daggerheart:loop_ring

# --- VERY FAR RING (90m, Blue, 1 deg steps = 360 particles) ---
data modify storage daggerheart:macro ring.radius set value 90.0f
data modify storage daggerheart:macro ring.color set value [0.2f, 0.2f, 1.0f]
scoreboard players set #angle dh_math 0
scoreboard players set #step dh_math 1
function daggerheart:loop_ring