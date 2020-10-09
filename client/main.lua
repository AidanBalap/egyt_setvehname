ESX = nil
EGYT = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
    Citizen.Wait(5000)  
    
    ESX.TriggerServerCallback('egyt_setvehname:getVehicles', function(vehicles)
        EGYT.LoadVehicleNames(vehicles)
    end)

end)

EGYT.LoadVehicleNames = function (vehicles)
    for k,vehicle in ipairs(vehicles) do
        for k,v in ipairs(Config.IgnoredCars) do
            ignore = false
            if v == vehicle.model then
                ignore = true
            end
        end

        if not ignore then
            AddTextEntryByHash(GetHashKey(vehicle.model), vehicle.name)
        end
    end
end