ESX.RegisterUsableItem('gourmetburger', function(source)
	local Player = ESX.GetPlayerFromId(source)
	Player.removeInventoryItem('gourmetburger', 1)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
end)

ESX.RegisterUsableItem('veggieburger', function(source)
	local Player = ESX.GetPlayerFromId(source)
	Player.removeInventoryItem('veggieburger', 1)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
end)

ESX.RegisterUsableItem('chickensand', function(source)
	local Player = ESX.GetPlayerFromId(source)
	Player.removeInventoryItem('chickensand', 1)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
end)