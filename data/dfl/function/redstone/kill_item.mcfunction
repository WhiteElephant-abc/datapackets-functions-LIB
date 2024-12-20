scoreboard objectives add dfl_number dummy
execute store result score @a dfl_number run kill @e[type=item,tag=!need]
tellraw @a [{"text":"[DFL] 清除了","color":"gray","italic":true},{"score":{"name":"*","objective":"dfl_number"},"color":"gray","italic":true},{"text":"个掉落物","color":"gray","italic":true}]