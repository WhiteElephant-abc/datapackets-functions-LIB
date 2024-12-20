scoreboard objectives add dfl_scoreboard dummy "DFL"
execute store result score entitynum dfl_scoreboard if entity @e[type=!minecraft:player,tag=!need]
$execute if score entitynum dfl_scoreboard matches $(num).. run tellraw @a [{"text":"[DFL] 实体过多，已清除","color":"gray","italic":true},{"score":{"name":"*","objective":"dfl_entitynum"},"color":"red"},{"text":"个实体","color":"gray","italic":true}]
$execute if score entitynum dfl_scoreboard matches $(num).. run tellraw @a [{"text":"想要防止实体被清除可以为实体","color":"gray","italic":true},{"text":"添加need标签","color":"blue","underlined":true,"italic":true,"clickEvent":{"action":"suggest_command","value":"/tag @s add need"}}]
$execute if score entitynum dfl_scoreboard matches $(num).. run kill @e[type=!minecraft:player,tag=!need]