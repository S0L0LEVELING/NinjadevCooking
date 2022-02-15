ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
end)

RegisterServerEvent('ninjadev_cooking:giveReward')
AddEventHandler('ninjadev_cooking:giveReward', function(item)
        local _source = source
        local player = ESX.GetPlayerFromId(_source)
        player.addInventoryItem(item, Config.RewardMultiplier)
end)

clothingdone = false

if Config.EnableCommand == false and clothingdone == true then
    ESX.RegisterUsableItem('cookbook', function(ELJ)
            local y9wjElIkpvpBp85 = ESX.GetPlayerFromId(ELJ)
            TriggerClientEvent("ninjadev_cooking:openCookbook", ELJ)
    end)
end

ESX.RegisterServerCallback("ninjadev_cooking:doesPlayerHaveIngredients", function(source, cb, VR)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        if clothingdone then
            for nr, val in ipairs(Config['Recipes']) do
                if val['recipe'] == VR['recipe'] then
                    local enough = false
                    for nr1, val1 in ipairs(val['ingredients']) do
                        if not (xPlayer.getInventoryItem(Config.Items[val1.ingredient]).count >= val1["amount"]) then
                            enough = false
                            cb(false)
                            break
                        end
                    end
                    if enough == false then
                        for nr2, val2 in ipairs(val['ingredients']) do
                            xPlayer.removeInventoryItem(Config.Items[val2.ingredient], val2["amount"])
                        end
                        cb(true)
                    end
                    break
                end
            end
        end
    end
)