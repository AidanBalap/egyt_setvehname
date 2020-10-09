ESX = nil
EGYT = {}
EGYT.ListedVehicles = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
    MySQL.Async.fetchAll('SELECT name, model FROM vehicles', {}, function(result)
        if result ~= nil then
            for k,v in ipairs(result) do
                table.insert(EGYT.ListedVehicles, {name = v.name, model = v.model})
            end
        end
    end)
end)

ESX.RegisterServerCallback('egyt_setvehname:getVehicles', function(source, cb)
    cb(EGYT.ListedVehicles)
end)