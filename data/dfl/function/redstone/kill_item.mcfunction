scoreboard objectives add number dummy
execute store result score @a number run kill @e[type=item,tag=!need]
tellraw @a [{"text":"[DFL] 清除了","color":"gray","italic":true},{"score":{"name":"*","objective":"number"},"color":"gray","italic":true},{"text":"个掉落物","color":"gray","italic":true}]