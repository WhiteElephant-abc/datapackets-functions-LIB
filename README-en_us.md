# Preface

_This data pack follows the open-source license [GNU GENERAL PUBLIC LICENSE](https://www.gnu.org/licenses/gpl-3.0.txt "Jump to this open-source license page")_  

**This data pack provides developers with some useful functions and is compatible with all versions of Minecraft (except for those versions where data packs cannot be installed).**

**However, since the data pack involves many commands, lower versions may not be able to use all functions. The applicable versions of all functions will not be noted separately below.**

**Please install the resource pack simultaneously to provide localized content (v3.2+). Otherwise, the language of the data packet will be zh_cn. Or you can use the mod version.**

**The mod version of this data pack is packaged via Modrinth and updated synchronously with the data pack version. The content is completely consistent with the data pack version.**

**After this data pack is loaded, a scoreboard objective "dfl_enable" will be created once per tick, and the scores of all entities in this scoreboard objective will be set to 1, facilitating data packs or mods that rely on this data pack to detect whether this data pack is loaded.**

**Example**:

```
# Execute when the data pack is loaded:
scoreboard objectives add dfl_enable dummy
scoreboard players set @e dfl_enable 0
# If not loaded:
execute unless score @n dfl_enable matches 1
# If loaded:
execute if score @n dfl_enable matches 1
```

**Note**: Some function usages are attached with "pre-functions", and these pre-functions must be executed once before the main functions are executed.

**Some function usages are followed by {xx:"xx"}. These functions are [macro functions](https://zh.minecraft.wiki/w/Java%E7%89%88%E5%87%BD%E6%95%B0#%E5%AE%8F). When using them, parameters need to be passed in through {<parameter name>:"<content>"} (the parameters in the usage are default parameters, which are recommended parameters tested by the author during development or parameters used by the author for testing). The parameter names (such as num) are presented in the text as: {num}. The parameter format can refer to the function usage, and special formats will be explained.**

If you encounter any problems, please click [here](https://github.com/WhiteElephant-abc/datapackets-functions-LIB/issues/new/choose) to give feedback.

# Function Explanation

## Start

**The functions in this category are recommended to be executed when the data pack is loaded (reloaded).**

### Disable Special Damage

Function usage: `/function dfl:start/nodamage`

- Fall damage
- Fire damage
- Freezing damage
- Drowning damage

### Set Respawn Point to 0 0

Function usage: `/function dfl:start/setworldspawn`

- Set the world respawn point to 0 0 0
- Set the respawn point radius to 0
- At this time, players will respawn on the highest block at coordinates 0 0.

### Enable Death Scoreboard

Function usage: `/function dfl:start/show/death`

- Create a scoreboard objective named "death"
- Display the number of deaths on the right side of the screen
- Sort players from the highest to the lowest number of deaths
- Note: The death scoreboard will not be displayed when it is first enabled. It will be displayed after any player dies.

### Display Player Health

Function usage: `/function dfl:start/show/health`

- Create a scoreboard objective named "health"
- Display the player's health below the player ID
- It will not be displayed when the distance is a bit far (only the player ID will be shown)
- Note: When it is first enabled, the health will be shown as 0. It will be updated after the value changes (such as getting injured).

### Display Player Experience Level

Function usage: `/function dfl:start/show/level`

- Create a scoreboard objective named "level"
- Display the experience level of each player in the Tab bar (player list bar)
- Note: When it is first enabled, the experience level will be shown as 0. It will be updated after the value changes (such as leveling up).

### Display Player Health Bar

Function usage: `/function dfl:start/show/health_list`

- Create a scoreboard objective named "health"
- Display the health bar of each player in the Tab bar (player list bar)
- The effect is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 1](https://zh.minecraft.wiki/images/Scoreboard_Display_List_Hearts.gif)

### Quickly Create Teams

Function usage: `/function dfl:start/addteam {team_blue:"blue",team_red:"red",prefix_blue:"blue",prefix_red:"red"}`

- Create two teams named {team_blue} and {team_red}
- The colors are blue and red respectively
- Disable damage between players in the same team
- Players can only collide with non-teammate entities
- The prefixes of player names are {prefix_blue}_ and {prefix_red}_ respectively.

## Tick

**The functions in this category are recommended to be executed once per tick.**

### Soft-ban Players

Function usage: `/function dfl:tick/ban`

- Note: The executor of this function must be the player to be banned. The execute command can be used.
- Soft-ban is achieved by constantly teleporting the player to 0 0 0, setting the mode to adventure, and constantly giving the player negative buffs.
- It must be executed once per tick.
- Example: `/execute as @a[tag=ban] run function dfl:tick/ban`

The effect is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 2](https://i.mcmod.cn/editor/upload/20241124/1732460069_829263_PTUj.webp)

### Beacon + Elytra Takeoff

Function usage: `/function dfl:tick/beacon_fly`

- When there are iron blocks, gold blocks, emerald blocks, diamond blocks, or netherite blocks under the beacon, the player will be teleported upwards (spectators will not be teleported).
- The heights are 20, 40, 60, 80, and 100 blocks respectively.
- The same blocks can be stacked to increase the height (the maximum is 400 blocks, using four netherite blocks). If the blocks are different, the block closest to the beacon will be used as the standard.

### One-click Negative Buffs

Function usage: `/function dfl:tick/debuff`
Give the **function executor** the following debuffs:

1. slowness
2. mining_fatigue
3. nausea
4. darkness
5. hunger
6. weakness
7. poison
8. unluck
9. trial_omen

### Iron Block Elevator

Function usage: `/function dfl:tick/iron_block_elevator`

- When a player stands between two iron blocks, the player will be teleported upwards.
- The maximum teleport distance is 6 blocks, that is, the maximum distance between two iron blocks is 5 blocks.
- Spectators will not be teleported.
- Biological and non-biological entities will be teleported.

### Clear Entities When There Are Too Many Entities

Function usage: `/function dfl:tick/kill {num:"1000"}`

- When the number of non-player entities is greater than {num}, all non-player entities will be cleared.
- Entities with the "need" tag will not be cleared.
- Entities with the "need" tag will not be counted in the number of entities here.
- Create a scoreboard objective named "dfl_scoreboard".
- After execution, a prompt will be shown in the chat bar. The effect is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 3](https://i.mcmod.cn/editor/upload/20241128/1732782965_829263_DgBT.webp)

### Clear Entities When Entity Density Is Too High

Function usage: `/function dfl:tick/kill_better {num:"50"}`
Pre-function: `/function dfl:lib/entity_density`

- When the number of entities within 10 blocks of all entities is greater than {num}, these entities will be cleared.
- Players will not be killed.
- Villagers will not be killed.
- Entities with the "need" tag will not be killed.
- No traces will be left in the chat bar.

### Experience Optimization

Function usage: `/function dfl:tick/relax`

- Enable keep inventory on death
- Give players night vision
- Give players glowing effect
- Remove the darkness effect from players.

### Display Entity Number

Function usage: `/function dfl:tick/show_entity`
Pre-function: `/function dfl:lib/entity`

- Display the real-time number of entities in the player's action bar (above the hotbar).
- The effect is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 4](https://i.mcmod.cn/editor/upload/2041124/1732462874_829263_RoxS.webp)

### Disable Player Friendly Fire and Collision

Function usage: `/function dfl:tick/team`

- Add a team named "dfl" and add all players to this team.
- Note: Since the same entity cannot join multiple teams, if you want to use the player teaming function, please do not enable this function.
- Disable friendly fire within the team.
- Disable collisions within the team.
- If this function is not run once per tick, please ensure that it is run once after each new player joins.

### Clear TNT When TNT Entity Density Is Too High

Function usage: `/function dfl:tick/kill_tnt {num:"200"}`

- When the number of TNT entities within 5 blocks of TNT is greater than {num}, these TNT entities will be cleared.
- Create a scoreboard objective named "dfl_tntdensity".

### Suicide for Players Without Permissions

Function usage: `/function dfl:tick/suicide`

- Create a scoreboard objective named "kill".
- Enter `/trigger kill` to commit suicide (this command does not require any permissions).

### Replace Blocks in a Large Range

Function usage: `/function dfl:tick/change_block {new:"glass",old:"stone",num:"30"}`

- Replace {old} blocks within a {num}3 * 8 range around the player with {new} blocks.
- Change the game rule "commandModificationBlockLimit" to 2147483647.

### Eternal Day + Eternal Clear Sky

Function usage: `/function dfl:tick/always_sunny`

- Disable day-night cycle
- Disable weather cycle
- Set the time to day
- Set the weather to clear.

### Clear a Single Item and Execute a Command

Function usage: `/function dfl:tick/clear_run_a {name:"stone",run:"tp ~ 100 ~"}`

- Clear one {name} item from all players and execute {run}.
- Note: There should be no extra spaces at the beginning or end of the command in the parameter "run", and there should be no slashes before the command.

### Clear Specified Items and Execute Commands Multiple Times

Function usage: `/function dfl:tick/clear_run_b {name:"sand",run:"give @s anvil"}`

- Clear all {name} items of the function executor and execute {run} the corresponding number of times (within the same tick).
- Note: There should be no extra spaces at the beginning or end of the command in the parameter "run", and there should be no slashes before the command.

### Keep a Certain Item

Function usage: `/function dfl:tick/keep_have_things {name:"slime_block",num:"64"}`

- Make the command executor have exactly the specified number of items.

### Self-rescue Platform

Function usage: `/function dfl:tick/slime`
Pre-function: `/function dfl:lib/gametime`

- Create a scoreboard objective named "dfl_slime_armor_stand_temp" to store the time when the slime platform is generated.
- Generate a 3*3 slime platform under the feet of the player with the "dfl_slime" tag and remove the tag. The slime platform can only cover air blocks.
- The slime blocks at the position of the slime platform will be cleared after `<the value in the dfl_scoreboard scoreboard objective named slime_time>` ticks.
- The dfl_scoreboard scoreboard objective named slime_time will be set to 200 (i.e., 10 seconds) when it is not assigned.
- The slime block drops within 2 blocks of the position where the player generates the platform will be cleared.

### Convert Items to Experience

Function usage: `/function dfl:tick/things_to_xp {name:"tnt",xp:"1"}`

- Convert the {name} items on the function executor into the corresponding number of {xp} experience points.

### tpa

Function usage: `/function dfl:tick/tpa`
Pre-function: `/function dfl:lib/player_id`

- Create scoreboard objectives named "tpa" and "tpa_enable".
- Enter `/trigger tpa set <the id of the player in the dfl_playerid scoreboard objective, which can be viewed via Tab>` to teleport to the corresponding player.
- Enter `/trigger tpa_enable` to allow other players to teleport to yourself. This cannot be revoked (if this command is not executed, all other players cannot teleport to this player). If a value other than 1 is set using "set" in this command, there will be no effect (other players will still not be allowed to teleport to this player). You can still set it to 1 again using "set" to allow other players to teleport to yourself.
- If the player to be teleported does not exist or has not allowed other players to teleport to themselves, the player will be teleported to the corresponding player after the corresponding player ID can be teleported. During this period, the tpa target can still be changed at will.

### Auto-smelting

Function usage: `/function auto_smelt:smelt {input:"raw_iron",output:"iron_ingot"}`

- Consumes the item specified by `{input}` and gives the executor of the function the corresponding quantity of the item specified by `{output}`.
- Smelting one item consumes 1 experience point. If the player has no experience, no item will be smelted.
- If the player has all three kinds of supported fuels in the inventory at the same time, these fuels will be consumed simultaneously.
- Consuming a coal block allows for smelting 9 items at once, with 9 experience points deducted.

## Redstone

**The functions in this category are recommended to be executed at intervals (you can use the [/schedule](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/schedule "Jump to wiki to view the usage of this command") command).**

### Clear Dropped Items

Function usage: `/function dfl:redstone/kill_item`

- Create a scoreboard objective named "dfl_scoreboard".
- Clear all dropped items and output the number of cleared dropped items via `/tellraw`.
- Dropped items with the "need" tag will not be cleared.
- The effect is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 5](https://i.mcmod.cn/editor/upload/20241125/1732464116_829263_BxRx.webp)

### Display Entity Quantity Information

Function usage: `/function dfl:redstone/show_entity`
Pre-functions: `/function dfl:lib/entity`
`/function dfl:lib/item`
`/function dfl:lib/other_entity`
The effect of this function is as follows:

![[DFL] Data Pack Function Support Library (datapackets functions LIB)-Picture 6](https://i.mcmod.cn/editor/upload/20241125/1732464350_829263_dYNP.webp)

## Lib

**Functions in this category have no effect when executed alone or do not fall into the above categories.**

### Force Death Drop

Function Usage: `/function dfl:lib/clear`

1. Disable the keep-inventory-on-death feature.
2. Kill the executor of the function.
3. Re-enable the keep-inventory-on-death feature.

### Get Entity Count

Function Usage: `/function dfl:lib/entity`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the number of entities into the `dfl_scoreboard` scoreboard objective named `entity`.

### Get Entity Density

Function Usage: `/function dfl:lib/entity_density`

- Create a scoreboard objective named `dfl_density`.
- Write the number of entities within 10 blocks of each entity into that entity's scoreboard objective.

### Get Dropped Item Count

Function Usage: `/function dfl:lib/item`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the number of dropped items into the `dfl_scoreboard` scoreboard objective named `item`.

### Get Non-player Entity Count

Function Usage: `/function dfl:lib/other_entity`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the number of non-player entities into the `dfl_scoreboard` scoreboard objective named `other_entity`.

### Get Game Days

Function Usage: `/function dfl:lib/day`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the number of game days into the `dfl_scoreboard` scoreboard objective named `day`.
- Game days are calculated as the integer quotient of the day-night cycle time divided by 24000, representing the number of full day-night cycles passed.

### Get Current Day Time

Function Usage: `/function dfl:lib/daytime`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the current day time into the `dfl_scoreboard` scoreboard objective named `daytime`.
- The current day time is the remainder of the day-night cycle time divided by 24000, which represents the number of game ticks passed since sunrise on the current day.

### Surround Player with Glass

Function Usage: `/function dfl:lib/fill_outline`

- Generate a 5*5 hollow glass cube at the location of the command executor.

### Get Game Time

Function Usage: `/function dfl:lib/gametime`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the game time into the `dfl_scoreboard` scoreboard objective named `gametime`.
- Also write it into the `dfl_gametime` scoreboard objective for all players. Game time refers to the total number of game ticks that have elapsed in the world.

### Get Player Count

Function Usage: `/function dfl:lib/players`

- Create a scoreboard objective named `dfl_scoreboard`.
- Write the number of players into the `dfl_scoreboard` scoreboard objective named `players`.

### Change Max Health

Function Usage: `/function dfl:lib/change_max_health {num:"100"}`

- Set the maximum health of all players to the value specified by `{num}`.

### Generate UID

Function Usage: `/function dfl:lib/player_id`

- Create scoreboard objectives named `dfl_playerid` and `dfl_scoreboard`.
- Store the progress of UID usage in the `dfl_scoreboard` scoreboard objective named `playerid_temp`.
- Assign each player a unique and unchanging UID in the `dfl_playerid` scoreboard.
- UIDs are numbers starting from 1. The player who joined the server first gets the smallest number, and so on.
- If there are more than one player in the server when the function is executed, the order in which UIDs are generated for these players is random.

### Count Item Quantity

Function Usage: `/function dfl:lib/things_count {name:"stone"}`

- Create a scoreboard objective named `dfl_{name}_num`.
- Write the quantity of the item `{name}` for all players into their respective scoreboard objectives.
