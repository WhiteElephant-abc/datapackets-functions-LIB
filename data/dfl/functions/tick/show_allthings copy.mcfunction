scoreboard objectives add things dummy "DFL"
scoreboard objectives setdisplay sidebar things

scoreboard players operation 实体总数 things = @r dfl_entity
scoreboard players operation 玩家总数 things = @r dfl_players
scoreboard players operation 非玩家实体总数 things = @r dfl_other_entity
scoreboard players operation 掉落物实体总数 things = @r dfl_item


scoreboard players operation 游戏天数 things = @r dfl_day
scoreboard players operation 当日时间 things = @r dfl_daytime
scoreboard players operation 世界流逝时间 things = @r dfl_gametime