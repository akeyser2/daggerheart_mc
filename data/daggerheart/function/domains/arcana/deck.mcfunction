# 1. Clear old data from the storage array
data remove storage daggerheart:arcana cards

# 2. Initialize an empty array
data modify storage daggerheart:arcana cards set value []

# 3. Run every modular card function to build the deck
function daggerheart:domains/arcana/rune_ward
function daggerheart:domains/arcana/unleash_chaos
function daggerheart:domains/arcana/wall_walk
function daggerheart:domains/arcana/cinder_grasp
function daggerheart:domains/arcana/floating_eye
function daggerheart:domains/arcana/counterspell
function daggerheart:domains/arcana/flight
function daggerheart:domains/arcana/blink_out
function daggerheart:domains/arcana/preservation_blast
function daggerheart:domains/arcana/chain_lightning
function daggerheart:domains/arcana/premonition
function daggerheart:domains/arcana/rift_walker
function daggerheart:domains/arcana/telekinesis
function daggerheart:domains/arcana/arcana_touched
function daggerheart:domains/arcana/cloaking_blast
function daggerheart:domains/arcana/arcane_reflection
function daggerheart:domains/arcana/confusing_aura
function daggerheart:domains/arcana/earthquake
function daggerheart:domains/arcana/sensory_projection
function daggerheart:domains/arcana/adjust_reality
function daggerheart:domains/arcana/falling_sky

# 4. Inject the completed memory array into the bundle
function daggerheart:domains/arcana/macro_give_deck with storage daggerheart:arcana