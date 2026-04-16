# Setup the scoreboard to track right clicks
scoreboard objectives add dh_click used:carrot_on_a_stick

# Setup the scoreboard for multiplayer entity tracking
scoreboard objectives add dh_id dummy

# Setup the team for the semi-transparent "ghost" effect
team add dh_ghost
team modify dh_ghost seeFriendlyInvisibles true