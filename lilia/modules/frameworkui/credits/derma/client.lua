﻿local MODULE = MODULE
local ScrW, ScrH = ScrW(), ScrH()
local logoMat = Material("lilia/lilia.png")
local textureID = surface.GetTextureID("models/effects/portalfunnel_sheet")
local PANEL = {}
do
    for _, v in ipairs(MODULE.GamemodeCreators) do
        steamworks.RequestPlayerInfo(v.steamid, function(steamName) v.name = steamName or "Loading..." end)
    end
end

function PANEL:Init()
    self.avatarImage = self:Add("AvatarImage")
    self.avatarImage:Dock(LEFT)
    self.avatarImage:SetSize(64, 64)
    self.name = self:Add("DLabel")
    self.name:SetFont("liaBigCredits")
    self.name:SetText("Loading...")
    self.desc = self:Add("DLabel")
    self.desc:SetFont("liaSmallCredits")
end

function PANEL:setAvatarImage(id)
    if not self.avatarImage then return end
    self.avatarImage:SetSteamID(id, 64)
    self.avatarImage.OnCursorEntered = function() surface.PlaySound("garrysmod/ui_return.wav") end
    self.avatarImage.OnMousePressed = function()
        surface.PlaySound("buttons/button14.wav")
        gui.OpenURL("http://steamcommunity.com/profiles/" .. id)
    end
end

function PANEL:setName(name, color)
    if not IsValid(self.name) then return end
    self.name:SetText(name)
    if color then self.name:SetTextColor(color) end
    self.name:SizeToContents()
    self.name:Dock(TOP)
    self.name:DockMargin(ScrW * 0.01, 0, 0, 0)
end

function PANEL:setDesc(desc)
    if not self.desc then return end
    self.desc:SetText(desc)
    self.desc:SizeToContents()
    self.desc:Dock(TOP)
    self.desc:SetTextColor(Color(255, 255, 255))
    self.desc:DockMargin(ScrW * 0.01, 0, 0, 0)
end

function PANEL:Paint(w, h)
    surface.SetTexture(textureID)
    surface.DrawTexturedRect(0, 0, w, h)
end

vgui.Register("CreditsNamePanel", PANEL, "DPanel")
PANEL = {}
function PANEL:Init()
    self.contButton = self:Add("DButton")
    self.contButton:SetFont("liaBigCredits")
    self.contButton:SetText(MODULE.contributors.desc)
    self.contButton:SetTextColor(Color(255, 255, 255))
    self.contButton.DoClick = function()
        surface.PlaySound("buttons/button14.wav")
        gui.OpenURL(MODULE.contributors.url)
    end

    self.contButton.Paint = function() end
    self.contButton:Dock(TOP)
    self:SizeToChildren(true, true)
end

function PANEL:Paint()
end

vgui.Register("CreditsContribPanel", PANEL, "DPanel")
PANEL = {}
function PANEL:Init()
end

function PANEL:setPerson(data, left)
    local id = left and "creditleft" or "creditright"
    self[id] = self:Add("CreditsNamePanel")
    self[id]:setAvatarImage(data.steamid)
    self[id]:setName(data.name, data.color)
    self[id]:setDesc(data.desc)
    self[id]:Dock(left and LEFT or RIGHT)
    self[id]:InvalidateLayout(true)
    self[id]:SizeToChildren(false, true)
    self:InvalidateLayout(true)
    self[id]:SetWide((self:GetWide() / 2) + 32)
end

function PANEL:Paint()
end

vgui.Register("CreditsCreditsList", PANEL, "DPanel")
PANEL = {}
function PANEL:Init()
end

function PANEL:Paint(w, h)
    surface.SetMaterial(logoMat)
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect((w / 2) - 128, (h / 2) - 128, 256, 256)
end

vgui.Register("CreditsLogo", PANEL, "DPanel")
PANEL = {}
function PANEL:Init()
    if lia.gui.creditsPanel then lia.gui.creditsPanel:Remove() end
    lia.gui.creditsPanel = self
    self:SetSize(ScrW * 0.3, ScrH * 0.7)
    self.logo = self:Add("CreditsLogo")
    self:SetPos(ScrW / 5, 0)
    self.logo:SetSize(ScrW * 0.4, ScrW * 0.1)
    self.logo:Dock(TOP)
    self.logo:DockMargin(0, 0, 0, ScrH * 0.05)
    self.contributors = self:Add("DLabel")
    self.contributors:SetFont("liaBigCredits")
    self.contributors:SetText("Lilia Development Team")
    self.contributors:SetTextColor(Color(255, 255, 255))
    self.contributors:SizeToContents()
    self.contributors:Dock(TOP)
    local dockLeft = ScrW * 0.15 - self.contributors:GetContentSize() / 2
    self.contributors:DockMargin(dockLeft, 0, 0, ScrH * 0.025)
    self.creditPanels = {}
    local curNum = 0
    for k, v in ipairs(MODULE.GamemodeCreators) do
        if k % 2 ~= 0 then
            self.creditPanels[k] = self:Add("CreditsCreditsList")
            curNum = k
            self.creditPanels[curNum]:SetSize(self:GetWide(), ScrH * 0.05)
            self.creditPanels[curNum]:setPerson(v, true)
            self.creditPanels[curNum]:Dock(TOP)
            self.creditPanels[curNum]:DockMargin(0, 0, 0, ScrH * 0.01)
        else
            self.creditPanels[curNum]:setPerson(v, false)
            self.creditPanels[curNum]:Dock(TOP)
            self.creditPanels[curNum]:DockMargin(0, 0, 0, ScrH * 0.01)
        end
    end

    self.contribPanel = self:Add("CreditsContribPanel")
    self.contribPanel:SizeToChildren(true, true)
    self.contribPanel:Dock(TOP)
end

function PANEL:Paint()
end

vgui.Register("liaCreditsList", PANEL, "DPanel")
