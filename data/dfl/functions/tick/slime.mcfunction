scoreboard objectives add dfl_scoreboard dummy "DFL"
execute unless score slime_time dfl_scoreboard matches -2147483648..2147483647 run scoreboard players set slime_time dfl_scoreboard 200
scoreboard players operation slime_temp dfl_scoreboard = gametime dfl_scoreboard
scoreboard players operation slime_temp dfl_scoreboard -= slime_time dfl_scoreboard
scoreboard objectives add dfl_slime_armor_stand_temp dummy
execute as @a[tag=dfl_slime] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:slime_block replace minecraft:air
execute as @a[tag=dfl_slime] at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true,Invisible:true,Invulnerable:true,Marker:true,Glowing:false,Silent:true,Tags:[dfl_slime_armor_stand_temp]}
execute as @e[type=armor_stand,tag=dfl_slime_armor_stand_temp] unless score @s dfl_slime_armor_stand_temp matches -2147483648..2147483647 run scoreboard players operation @s dfl_slime_armor_stand_temp = gametime dfl_scoreboard
execute as @e[type=armor_stand,tag=dfl_slime_armor_stand_temp] at @s if score @s dfl_slime_armor_stand_temp < slime_temp dfl_scoreboard run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:air replace minecraft:slime_block
execute as @e[type=armor_stand,tag=dfl_slime_armor_stand_temp] if score @s dfl_slime_armor_stand_temp < slime_temp dfl_scoreboard run kill
execute as @e[type=armor_stand,tag=dfl_slime_armor_stand_temp] at @s run kill @e[type=item,distance=..2,nbt={Item:{id:"minecraft:slime_block"}}]
tag @a remove dfl_slime