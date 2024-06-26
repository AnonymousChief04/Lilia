--- Configuration for Permissions Module.
-- @configurationmodule Permissions

--- This table defines the default settings for the Permissions Module.
-- @realm shared
-- @table Configuration
-- @field RestrictedEnts List of entities blocked from physgun pick up and proprieties when used by regular players | **table**
-- @field RemoverBlockedEntities List of entities blocked from the remover tool when used by regular players | **table**
-- @field DuplicatorBlackList List of entities blocked from the duplicator tool when used by regular players | **table**
-- @field RestrictedVehicles List of vehicles restricted from general spawn | **table**
-- @field BlackListedProps List of props restricted from general spawn | **table**
-- @field CanNotPermaProp List of entities restricted from perma propping | **table**
-- @field ButtonList List of button models to prevent button spamming exploits | **table**
-- @field PassableOnFreeze Makes it so that props frozen can be passed through when frozen | **bool**
-- @field PlayerSpawnVehicleDelay Delay for spawning a vehicle after the previous one | **integer**
-- @field ToolInterval ToolGun Usage Cooldown | **integer**
-- @field SpawnMenuLimit Should Spawn Menu be limited to pet flag holders/staff | **bool**