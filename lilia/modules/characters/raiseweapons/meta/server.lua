local playerMeta = FindMetaTable("Player")
function playerMeta:setWepRaised(state, notification)
	self:setNetVar("raised", state)
	local weapon = self:GetActiveWeapon()
	if IsValid(weapon) then
		weapon:SetNextPrimaryFire(CurTime() + 1)
		weapon:SetNextSecondaryFire(CurTime() + 1)
	end
	local weaponClass = weapon:GetClass()
	local action = state and "raises" or "lowers"
	local itemType = weaponClass == "lia_hands" and "hands" or "weapon"
	if notification then
		lia.chat.send(self, "iteminternal", action .. " his " .. itemType, false)
	end
end

function playerMeta:toggleWepRaised()
    timer.Simple(1, function() self:setWepRaised(not self:isWepRaised(), true) end)
    local weapon = self:GetActiveWeapon()
    if IsValid(weapon) then
        if self:isWepRaised() and weapon.OnRaised then
            weapon:OnRaised()
        elseif not self:isWepRaised() and weapon.OnLowered then
            weapon:OnLowered()
        end
    end
end
