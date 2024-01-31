﻿---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
local PANEL = {}
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
function PANEL:Init()
    self:SetTitle("Third Person Configuration")
    self:SetSize(300, 140)
    self:Center()
    self:MakePopup()
    self.list = self:Add("DPanel")
    self.list:Dock(FILL)
    self.list:DockMargin(0, 0, 0, 0)
    local cfg = self.list:Add("DNumSlider")
    cfg:Dock(TOP)
    cfg:SetText("Height")
    cfg:SetMin(0)
    cfg:SetMax(ThirdPersonCore.MaxValues.height)
    cfg:SetDecimals(0)
    cfg:SetConVar("tp_vertical")
    cfg:DockMargin(10, 0, 0, 5)
    local cfg2 = self.list:Add("DNumSlider")
    cfg2:Dock(TOP)
    cfg2:SetText("Horizontal")
    cfg2:SetMin(-ThirdPersonCore.MaxValues.horizontal)
    cfg2:SetMax(ThirdPersonCore.MaxValues.horizontal)
    cfg2:SetDecimals(0)
    cfg2:SetConVar("tp_horizontal")
    cfg2:DockMargin(10, 0, 0, 5)
    local cfg3 = self.list:Add("DNumSlider")
    cfg3:Dock(TOP)
    cfg3:SetText("Distance")
    cfg3:SetMin(0)
    cfg3:SetMax(ThirdPersonCore.MaxValues.distance)
    cfg3:SetDecimals(0)
    cfg3:SetConVar("tp_distance")
    cfg3:DockMargin(10, 0, 0, 5)
end

---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
vgui.Register("ThirdPersonConfig", PANEL, "DFrame")
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
