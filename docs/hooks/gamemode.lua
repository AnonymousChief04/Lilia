--[[--
General Hooks.

These hooks are regular hooks that can be used in your schema with `SCHEMA:HookName(args)`, in your module with
`MODULE:HookName(args)`, or in your addon with `hook.Add("HookName", function(args) end)`.
They can be used for an assorted of reasons, depending on what you are trying to achieve.
]]
-- @hooksgeneral Module

--- Called when a player picks up money.
-- This function is called when a player picks up money from the groun
-- @client client The player who picked up the money
-- @entity moneyEntity The entity representing the money being picked 
-- @realm server
function OnPickupMoney(client, moneyEntity)
end
--- Determines whether an item can be transferred between inventories.
-- @realm shared
-- This hook allows custom logic to be implemented to determine if an em can be transferred
-- from one inventory to another. It can be used to impose restrictionon item transfers.
-- @param item The item being transferred
-- @param currentInv The current inventory from which the item is beintransferred
-- @param oldInv The old inventory to which the item belonged
-- @treturn boolean|string Whether the item can be transferred, or fal and a reason if not
function CanItemBeTransfered(item, currentInv, oldInv)
end

--- Determines whether a client should drown.
-- @realm server
-- @client client The player entity.
-- @treturn boolean True if the client should drown, false otherwise.
function ShouldClientDrown(client)
end

--- Called whenever an item entity has spawned in the world. You can access the entity's item table with
-- `entity:getItemTable()`.
-- @realm server
-- @entity entity Spawned item entity
-- @usage function MODULE:OnItemSpawned(entity)
-- 	local item = entity:getItemTable()
-- 	-- do something with the item here
-- end
function OnItemSpawned(entity)
end

--- Called when the screen resolution changes.
-- @realm client
-- @int width number The new width of the screen.
-- @int height number The new height of the screen.
function ScreenResolutionChanged(width, height)
end

--- Determines whether a player should be shown on the scoreboard.
--- @realm client
--- @client client The player entity to be evaluated.
--- @treturn bool True if the player should be shown on the scoreboard, false otherwise.
function ShouldShowPlayerOnScoreboard(client)
end

-- This function determines whether certain information can be displayed in the character info panel inthe F1 menu.
-- @realm client
-- @table Information to **NOT** display in the UI. This is a table of the names of some panels to avoi displaying. Valid names include:
-- `name` name of the character
-- `desc` description of the character
-- `faction` faction name of the character
-- `money` current money the character has
-- `class` name of the character's class if they're in one
-- Note that schemas/modules can add additional character info panels.
-- @usage function MODULE:CanDisplayCharInfo(suppress)
-- 	suppress.faction = true
-- end
function CanDisplayCharInfo(suppress)
end

--- Creates menu buttons for the F1 menu.
--- @tab tabs A table to store the created buttons.
--- @realm client
function CreateMenuButtons(tabs)
end

--- Called when a player's model is changed.
--- @client client The client whose model is changed.
--- @string model The new model path.
--- @realm shared
function PlayerModelChanged(client, model)
end

--- Loads custom fonts for the client.
--- @string font The path to the font file.
--- @string genericFont The path to the generic font file.
--- @realm client
function LoadFonts(font, genericFont)
end

--- Loads Core Lilia fonts for the client.
--- @string font The path to the font file.
--- @string genericFont The path to the generic font file.
--- @realm client
-- @internal
function LoadLiliaFonts(font, genericFont)
end

--- Called when lia.config has been initialized.
--- @realm shared
function InitializedConfig()
end

--- Called when all the modules have been initialized.
--- @realm shared
function InitializedModules()
end

--- Called when the schema has been initialized.
--- @realm shared
function InitializedSchema()
end

--- Called when a module has finished loading.
--- @realm shared
function ModuleLoaded()
end

--- Called when the database has been successfully connected.
--- @realm server
-- @internal
function DatabaseConnected()
end

--- Called after wiping tables.
--- @realm server
-- @internal
function OnWipeTables()
end

--- Sets up the database.
--- @realm server
-- @internal
function SetupDatabase()
end

--- Saves the server data.
-- @realm server
function SaveData()
end

--- Loads the server data.
-- @realm server
function LoadData()
end

--- Called after data has been loaded.
-- @realm server
function PostLoadData()
end

--- Called to determine whether data should be saved before shutting down the server.
-- This function is called to determine whether data should be saved bore the server shuts down.
-- @treturn boolean True if data should be saved, false otherwise
-- @realm server
function ShouldDataBeSaved()
end

--- Whether or not a player can unequip an item.
-- @realm server
-- @client client Player attempting to unequip an item
-- @tab item Item being unequipped
-- @treturn bool Whether or not to allow the player to unequip the item
-- @see CanPlayerEquipItem
-- @usage function MODULE:CanPlayerUnequipItem(client, item)
-- 	return false -- Disallow unequipping items.
-- end
function CanPlayerUnequipItem(client, item)
end

--- Whether or not a player is allowed to drop the given `item`.
-- @realm server
-- @client client Player attempting to drop an item
-- @number item instance ID of the item being dropped
-- @treturn bool Whether or not to allow the player to drop the item
-- @usage function MODULE:CanPlayerDropItem(client, item)
-- 	return false -- Never allow dropping items.
-- end
function CanPlayerDropItem(client, item)
end

--- Whether or not a player is allowed to take an item and put it in their inventory.
-- @realm server
-- @client client Player attempting to take the item
-- @entity item Entity corresponding to the item
-- @treturn bool Whether or not to allow the player to take the item
-- @usage function MODULE:CanPlayerTakeItem(client, item)
-- 	return !(client:GetMoveType() == MOVETYPE_NOCLIP and !client:InVehicle()) -- Disallow players in observer taking items.
-- end
function CanPlayerTakeItem(client, item)
end

--- Whether or not a player can equip the given `item`. This is called for items with `outfit`, `pacoutfit`, or `weapons` as
-- their base. Schemas/modules can utilize this hook for their items.
-- @realm server
-- @client client Player attempting to equip the item
-- @tab item Item being equipped
-- @treturn bool Whether or not to allow the player to equip the item
-- @see CanPlayerUnequipItem
-- @usage function MODULE:CanPlayerEquipItem(client, item)
-- 	return client:IsAdmin() -- Restrict equipping items to admins only.
-- end
function CanPlayerEquipItem(client, item)
end

--- Whether or not a player is allowed to interact with an item via an inventory action (e.g picking up, dropping, transferring
-- inventories, etc). Note that this is for an item *table*, not an item *entity*. This is called after `CanPlayerDropItem`
-- and `CanPlayerTakeItem`.
-- @realm server
-- @client client Player attempting interaction
-- @string action The action being performed
-- @param item Item's instance ID or item table
-- @treturn bool Whether or not to allow the player to interact with the item
-- @usage function MODULE:CanPlayerInteractItem(client, action, item, data)
-- 	return false -- Disallow interacting with any item.
-- end
function CanPlayerInteractItem(client, action, item)
end