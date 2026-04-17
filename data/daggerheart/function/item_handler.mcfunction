# Check for the Daggerheart Catalyst
execute if items entity @s weapon.mainhand *[custom_data~{daggerheart_item:1b}] run function daggerheart:toggle

# Check for the Stat Manager Item
execute if items entity @s weapon.mainhand *[custom_data~{dh_stat_manager:1b}] run function daggerheart:stat_menu