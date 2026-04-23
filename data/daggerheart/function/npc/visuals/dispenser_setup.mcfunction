# Place Dispenser and trigger it with whatever is in the offhand
setblock ~ ~ ~ dispenser[facing=up] replace
item replace block ~ ~ ~ container.0 from entity @p weapon.offhand
setblock ~ ~-1 ~ redstone_block replace

# Schedule cleanup
schedule function daggerheart:npc/visuals/dispenser_cleanup 3t