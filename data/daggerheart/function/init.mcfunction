# Setup the scoreboard to track right clicks
scoreboard objectives add dh_click used:carrot_on_a_stick

# Setup the scoreboard for multiplayer entity tracking
scoreboard objectives add dh_id dummy

# Setup the team for the semi-transparent "ghost" effect
team add dh_ghost
team modify dh_ghost seeFriendlyInvisibles true

# Setup the scoreboard for macro loop math
scoreboard objectives add dh_math dummy

# Setup the multiplayer-safe trigger scoreboard for our custom menu
scoreboard objectives add dh_menu trigger