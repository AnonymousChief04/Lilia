-- @type method freezeallprops - Freeze All Props
-- @typeCommentStart
-- Freezes all prop_physics entities in the game.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @string syntax The syntax for this command is empty.
-- @usageStart
-- /freezeallprops - Freezes all props in the game.
-- @usageEnd
lia.command.add("freezeallprops", {
    syntax = "",
    onRun = function(client, arguments)
        if not client:IsAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        for k, v in pairs(ents.FindByClass("prop_physics")) do
            local physObj = v:GetPhysicsObject()

            if IsValid(physObj) then
                physObj:EnableMotion(false)
                physObj:Sleep()
            end
        end
    end
})

-- @type method clearinv - Clear Inventory
-- @typeCommentStart
-- Clears the inventory of the specified player.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @string syntax The syntax for this command is "<string name>".
-- @usageStart
-- /clearinv <player> - Clears the inventory of the specified player.
-- @usageEnd
lia.command.add("clearinv", {
    syntax = "<string name>",
    onRun = function(client, arguments)
        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        local target = lia.command.findPlayer(client, arguments[1])

        if IsValid(target) and target:getChar() then
            for k, v in pairs(target:getChar():getInv():getItems()) do
                v:remove()
            end

            client:notifyLocalized("resetInv", target:getChar():getName())
        end
    end
})

-- @type method flaggive - Give Flags
-- @typeCommentStart
-- Gives the specified flags to the target player.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @string syntax The syntax for this command is "<string name> [string flags]".
-- @usageStart
-- /flaggive <player> <flags> - Gives the specified flags to the target player.
-- @usageEnd
lia.command.add("flaggive", {
    syntax = "<string name> [string flags]",
    onRun = function(client, arguments)
        local target = lia.command.findPlayer(client, arguments[1])

        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if IsValid(target) and target:getChar() then
            local flags = arguments[2]

            if (flags == "l" or flags == "y" or flags == "b" or flags == "ybl" or flags == "lby" or flags == "byl") and not client:IsSuperAdmin() then
                client:notify("No permission!")

                return false
            end

            if not flags then
                local available = ""

                for k in SortedPairs(lia.flag.list) do
                    if not target:getChar():hasFlags(k) then
                        available = available .. k
                    end
                end

                return client:requestString("@flagGiveTitle", "@flagGiveDesc", function(text)
                    lia.command.run(client, "flaggive", {target:Name(), text})
                end, available)
            end

            target:getChar():giveFlags(flags)
            client:notifyLocalized("flagGive", client:Name(), target:Name(), flags)
        end
    end
})

-- @type method flagtake - Take Flags
-- @typeCommentStart
-- Takes the specified flags from the target player.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @string syntax The syntax for this command is "<string name> [string flags]".
-- @usageStart
-- /flagtake <player> <flags> - Takes the specified flags from the target player.
-- @usageEnd
lia.command.add("flagtake", {
    adminOnly = true,
    syntax = "<string name> [string flags]",
    onRun = function(client, arguments)
        local target = lia.command.findPlayer(client, arguments[1])

        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if IsValid(target) and target:getChar() then
            local flags = arguments[2]

            if not flags then
                return client:requestString("@flagTakeTitle", "@flagTakeDesc", function(text)
                    lia.command.run(client, "flagtake", {target:Name(), text})
                end, target:getChar():getFlags())
            end

            target:getChar():takeFlags(flags)
            client:notifyLocalized("flagTake", client:Name(), flags, target:Name())
        end
    end
})

-- @type method flags - Get Character Flags
-- @typeCommentStart
-- Displays the flags of the target player's character.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @string syntax The syntax for this command is "<string name>".
-- @usageStart
-- /flags <player> - Displays the flags of the target player's character.
-- @usageEnd
lia.command.add("flags", {
    adminOnly = true,
    syntax = "<string name>",
    onRun = function(client, arguments)
        local target = lia.command.findPlayer(client, arguments[1])

        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        if IsValid(target) and target:getChar() then
            client:notify("Their character flags are: '" .. target:getChar():getFlags() .. "'")
        end
    end
})

-- @type method findallflags - Find All Flags
-- @typeCommentStart
-- Finds and displays the flags of all players in the game.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @usageStart
-- /findallflags - Finds and displays the flags of all players in the game.
-- @usageEnd
lia.command.add("findallflags", {
    onRun = function(client, arguments)
        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        for k, v in pairs(player.GetHumans()) do
            client:ChatPrint(v:Name() .. " — " .. v:getChar():getFlags())
        end
    end
})

-- @type method musicstopglobal - Stop Global Music
-- @typeCommentStart
-- Stops the music for all players in the game.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @usageStart
-- /musicstopglobal - Stops the music for all players in the game.
-- @usageEnd
lia.command.add("musicstopglobal", {
    onRun = function(client, arguments)
        if not client:IsSuperAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        for k, v in pairs(player.GetAll()) do
            v:ConCommand("wmcp_stop")
            client:notify("Music stopped for everyone.")
        end
    end
})

-- @type method clearchat - Clear Chat
-- @typeCommentStart
-- Clears the chat for all players in the game.
-- @typeCommentEnd
-- @classmod Commands
-- @realm server
-- @usageStart
-- /clearchat - Clears the chat for all players in the game.
-- @usageEnd
lia.command.add("clearchat", {
    adminOnly = true,
    onRun = function(client, arguments)
        if not client:IsAdmin() then
            client:notify("Your rank is not high enough to use this command.")

            return false
        end

        netstream.Start(player.GetAll(), "adminClearChat")
        lia.log.addRaw(client:GetName() .. " has cleared the chat.")
    end
})