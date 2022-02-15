ESX = nil

local preparing = false

Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject',function(obj)
                    ESX = obj
            end)
            Citizen.Wait(0)
        end
        SetNuiFocus(false, false)
end)

OpenCookbook = function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = 'openCookbook', pages = Config.Recipes})
end

RegisterNetEvent('ninjadev_cooking:openCookbook')
AddEventHandler('ninjadev_cooking:openCookbook',function()
        inMenu = true
        OpenCookbook()
end)

OpenMenu = function(z4a)
    local ped = PlayerPedId()
    local table = {}
    for nr, val in ipairs(Config.Recipes) do
        table.insert(table, {['label'] = val['recipe'], ['value'] = val})
    end
    preparing = true
    ESX.UI.Menu.Open('default',GetCurrentResourceName(),'ninjadev_cooking_menu',
        {
            ['title'] = _U('menu_label'),
            ['align'] = Config.MenuAlign, 
            ['elements'] = table
        },
        function(ev, menu)
            if ev.current.value then
                ESX.TriggerServerCallback('ninjadev_cooking:doesPlayerHaveIngredients', function(doesHeHavethem)
                        if doesHeHavethem then
                            menu.close()
                            SetEntityHeading(ped, z4a)
                            FreezeEntityPosition(ped, true)
                            TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BBQ', 0, false)
                            Citizen.Wait(15000)
                            TriggerServerEvent('ninjadev_cooking:giveReward', ev.current.value.item)
                            local objCloseBy = GetClosestObjectOfType('prop_fish_slice_01', GetEntityCoords(PlayerPedId()))
                            if DoesEntityExist(objCloseBy) then
                                DeleteEntity(objCloseBy)
                            end
                            ClearPedTasks(ped)
                            FreezeEntityPosition(ped, false)
                            preparing = false
                        else
                            ESX.ShowNotification(_U('check_cookbook'))
                        end
                end, ev.current.value)
            end
        end,
        function(d, menu)
            menu.close()
            preparing = false
        end)
end

if Config.EnableCommand then
    RegisterCommand(Config.Command,function()
            inMenu = true
            OpenCookbook()
    end)
end

RegisterNUICallback('close', function(source, cb)
        SetNuiFocus(false)
end)

AddEventHandler('onResourceStop',function(resourceName)
        if resourceName == GetCurrentResourceName() then
            if inMenu then
                inMenu = false
                SetNuiFocus(false, false)
                SendNUIMessage({type = 'closeAll'})
            end
        end
end)

Citizen.CreateThread(function()
        while true do
            local l = 1000
            if ESX and not preparing then
                local localPlyPed = PlayerPedId()
                local localPlyCoords = GetEntityCoords(localPlyPed)
                for nr4, valuee in pairs(Config.Locations) do
                    if GetDistanceBetweenCoords(localPlyCoords, valuee['coords'], true) < 1.5 then
                        l = 5
                        ESX.Game.Utils.DrawText3D(valuee['coords'], _U('marker_text'), Config.TextSize)
                        if IsControlJustReleased(0, 38) then
                            OpenMenu(valuee['heading'])
                        end
                    end
                end
            end
            Citizen.Wait(l)
        end
    end
)
