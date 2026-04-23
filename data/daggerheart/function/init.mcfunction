# Setup the scoreboard to track right clicks
scoreboard objectives add dh_click used:carrot_on_a_stick

# Setup the scoreboard for multiplayer entity tracking
scoreboard objectives add dh_id dummy

# Setup the team for the semi-transparent "ghost" effect
team add dh_ghost
team modify dh_ghost seeFriendlyInvisibles true

# Setup the scoreboard for macro loop math
scoreboard objectives add dh_math dummy

# Setup scoreboards for Hope and Stress resources
scoreboard objectives add dh_hope dummy
scoreboard objectives add dh_stress dummy

scoreboard objectives add click_npc_stick minecraft.used:minecraft.warped_fungus_on_a_stick