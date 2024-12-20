scoreboard objectives add entitynum dummy
execute store result score @a entitynum if entity @e[type=!minecraft:player,tag=!need]
execute if score @r entitynum matches 500.. run \
    tellraw @a {"text":"[DFL] 实体过多，已清除500个实体","color":"gray","italic":true}
execute if score @r entitynum matches 500.. run \
    tellraw @a [{"text":"想要防止实体被清除可以为实体","color":"gray","italic":true},{"text":"添加need标签","color":"blue","underlined":true,"italic":true,"clickEvent":{"action":"suggest_command","value":"/tag @s add need"}}]
execute if score @r entitynum matches 500.. run kill @e[type=!minecraft:player,tag=!need]