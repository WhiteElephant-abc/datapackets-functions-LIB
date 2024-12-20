$function dfl:lib/things_count {name:"$(name)"}

$execute if score @s dfl_$(name)_num matches 1.. run xp add @s $(xp)
$execute if score @s dfl_$(name)_num matches 1.. run clear @s $(name) 1
$execute if score @s dfl_$(name)_num matches 0 run return fail
$function dfl:tick/things_to_xp {name:"$(name)",xp:"$(xp)"}