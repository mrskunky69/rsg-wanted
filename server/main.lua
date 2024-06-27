local RSGCore = exports['rsg-core']:GetCoreObject()

local date = "14/01/1800"
local reason = "For Bank Robbery"
local description = "breaking the law in the county"
local reward = "2500"
local image = "https://discord.com/channels/1070422645667012628/1099372115058229310/1114263333571399834"

function insertPosterData(date, reason, description, reward, image, source, isEdited)
    local insertQuery = "INSERT INTO wanted_posters (date, reason, description, reward, image, created_by, is_edited) VALUES (@date, @reason, @description, @reward, @image, @created_by, @is_edited)"
    local values = {
        ['@date'] = date,
        ['@reason'] = reason,
        ['@description'] = description,
        ['@reward'] = reward,
        ['@image'] = image,
        ['@created_by'] = source,
        ['@is_edited'] = isEdited
    }

    MySQL.Async.execute(insertQuery, values, function(result)
        if result then
            print("Poster data inserted successfully!")
        else
            print("Failed to insert poster data.")
        end
    end)
end

RegisterServerEvent('rsg-wanted:openUI:server')
AddEventHandler('rsg-wanted:openUI:server', function()
    local src = source
    local selectQuery = "SELECT * FROM wanted_posters ORDER BY created_at DESC LIMIT 1"

    MySQL.Async.fetchAll(selectQuery, {}, function(result)
        if result and #result > 0 then
            local posterData = result[1]
            TriggerClientEvent('rsg-wanted:receivePosterData', src, posterData.date, posterData.reason, posterData.description, posterData.reward, posterData.image)
        else
            print("No edited poster data found.")
        end
    end)
end)

RegisterServerEvent('rsg-wanted:getPosterData')
AddEventHandler('rsg-wanted:getPosterData', function()
    local src = source
    local selectQuery = "SELECT date, reason, description, reward, image FROM wanted_posters WHERE is_edited = 1 ORDER BY created_at DESC LIMIT 1"

    MySQL.query(selectQuery, {}, function(result)
        if result and #result > 0 then
            local posterData = result[1]
            TriggerClientEvent('rsg-wanted:receivePosterData', src, posterData.date, posterData.reason, posterData.description, posterData.reward, posterData.image)
        else
            TriggerClientEvent('rsg-wanted:receivePosterData', src, nil, nil, nil, nil, nil)
        end
    end)
end)

RegisterServerEvent('rsg-wanted:dataYenile')
AddEventHandler('rsg-wanted:dataYenile', function(dateData, reasonData, descData, rewardData, imageData)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)

    -- Remove the old poster data from the database
    local deleteQuery = "DELETE FROM wanted_posters WHERE is_edited = 1"
    MySQL.Async.execute(deleteQuery, {})

    insertPosterData(dateData, reasonData, descData, rewardData, imageData, xPlayer.PlayerData.citizenid, true)
end)

RegisterServerEvent('rsg-wanted:buy:server')
AddEventHandler('rsg-wanted:buy:server', function()
    local xPlayer = RSGCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveMoney(Config['General']['buyType'], Config['General']['buyAmount'])
    xPlayer.Functions.AddItem('wanted_paper')
end)

RSGCore.Functions.CreateUseableItem('wanted_paper', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-wanted:openUI', src)
end)
