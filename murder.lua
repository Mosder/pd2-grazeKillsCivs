local origGraze = SniperGrazeDamage.on_weapon_fired

function SniperGrazeDamage:on_weapon_fired(weapon_unit, result)
    local origGetMask = managers.slot.get_mask
    function managers.slot:get_mask(...)
        return origGetMask(self, "civilians", ...)
    end

    local returnVal = origGraze(self, weapon_unit, result)

    managers.slot.get_mask = origGetMask

    return returnVal
end