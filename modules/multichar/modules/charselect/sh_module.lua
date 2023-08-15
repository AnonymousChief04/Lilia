MODULE.name = "Lilia Character Selection"
MODULE.author = "Leonheart#7476/Cheesenot"
MODULE.desc = "The Lilia character selection screen."
lia.util.includeDir(MODULE.path .. "/derma/steps", true)
if SERVER then return end

local function ScreenScale(size)
    return size * (ScrH() / 900) + 10
end

function MODULE:LoadFonts(font)
    surface.CreateFont("liaCharTitleFont", {
        font = font,
        weight = 200,
        size = ScreenScale(70),
        additive = true
    })

    surface.CreateFont("liaCharDescFont", {
        font = font,
        weight = 200,
        size = ScreenScale(24),
        additive = true
    })

    surface.CreateFont("liaCharSubTitleFont", {
        font = font,
        weight = 200,
        size = ScreenScale(12),
        additive = true
    })

    surface.CreateFont("liaCharButtonFont", {
        font = font,
        weight = 200,
        size = ScreenScale(24),
        additive = true
    })

    surface.CreateFont("liaCharSmallButtonFont", {
        font = font,
        weight = 200,
        size = ScreenScale(22),
        additive = true
    })
end

function MODULE:LiliaLoaded()
    vgui.Create("liaCharacter")
end

function MODULE:KickedFromCharacter(id, isCurrentChar)
    if isCurrentChar then
        vgui.Create("liaCharacter")
    end
end

function MODULE:CreateMenuButtons(tabs)
    tabs["characters"] = function(panel)
        if IsValid(lia.gui.menu) then
            lia.gui.menu:Remove()
        end

        vgui.Create("liaCharacter")
    end
end