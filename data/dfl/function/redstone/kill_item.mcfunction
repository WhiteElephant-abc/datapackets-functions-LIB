scoreboard objectives add dfl_scoreboard dummy "DFL"
execute store result score item_number dfl_scoreboard run kill @e[type=item,tag=!need]
tellraw @a [{"text":"[DFL] 清除了","color":"gray","italic":true},{"score":{"name":"item_number","objective":"dfl_scoreboard"},"color":"gray","italic":true},{"text":"个掉落物","color":"gray","italic":true}]