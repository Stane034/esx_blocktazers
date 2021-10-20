ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local kick_message = 'Unauthorized Taze Detected!'

AddEventHandler('weaponDamageEvent', function(sender, data)
    local src = sender
    local src_name = GetPlayerName(src)
    if src_name ~= nil then
        if data.weaponType == 911657153 then --'WEAPON_STUNGUN'
            local xPlayer = ESX.GetPlayerFromId(src)
            if not xPlayer.getWeapon('WEAPON_STUNGUN') then     
               CancelEvent()
               print('^1'..src_name..'^0 (ID: ^1'..src..'^0) has just been kicked for an unauthorized taze against another player!')
               DropPlayer(src, kick_message)
            end
        end
    end
end)
