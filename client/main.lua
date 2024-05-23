local RSGCore = exports['rsg-core']:GetCoreObject()

Citizen.CreateThread(function()
    -- Target
    if Config['Target']['targetOptions'] then
        if Config['Target']['targetType'] == 'rsgcore' then
            exports['rsg-target']:AddCircleZone("batuflex", Config['Target']['targetCoords']['coords'], 0.47, {
                name = "batuflex",
                useZ=true,
                debugPoly = false,
                }, {
                options = {
                    {
                        event = "rsg-wanted:openEditor",
                        icon = Config['Target']['targetIcon']['editor'],
                        label = Config['Target']['targetLabels']['editor'],
                        
                    },
                    {
                        event = "rsg-wanted:openUI",
                        icon = Config['Target']['targetIcon']['preview'],
                        label = Config['Target']['targetLabels']['preview'],
                       
                    },
                },
                distance = 3
            })
            exports['rsg-target']:AddTargetModel(362284035, {
                options = {
                    {
                        event = "rsg-wanted:openUI",
                        icon = Config['Target']['targetIcon']['preview'],
                        label = Config['Target']['targetLabels']['preview'],
                    },
                    {
                        event = "rsg-wanted:buy",
                        icon = Config['Target']['targetIcon']['preview'],
                        label = Config['Target']['targetLabels']['buy'],
                    },
					{
                        event = "rsg-wanted:openEditor",
                        icon = Config['Target']['targetIcon']['editor'],
                        label = Config['Target']['targetLabels']['editor'],
                        
                    },
                    {
                        event = "rsg-wanted:openUI",
                        icon = Config['Target']['targetIcon']['preview'],
                        label = Config['Target']['targetLabels']['preview'],
                       
                    },
                },
                distance = 2.5
            })
        end
    end
end)

RegisterNUICallback('getPosterData', function(data, cb)
    TriggerServerEvent('rsg-wanted:getPosterData')
    cb('ok')
end)

RegisterNetEvent('rsg-wanted:receivePosterData')
AddEventHandler('rsg-wanted:receivePosterData', function(date, reason, description, reward, image)
    if date ~= nil then
        SendNUIMessage({
            action = "openNormal",
            date = date,
            reason = reason,
            description = description,
            reward = reward,
            image = image
        })
        SetNuiFocus(true, true)
    else
        
    end
end)

RegisterNetEvent('rsg-wanted:buy', function()
    TriggerServerEvent('rsg-wanted:buy:server')
end)

RegisterNetEvent('rsg-wanted:openUI', function()
    TriggerServerEvent('rsg-wanted:openUI:server')
end)

RegisterNetEvent('rsg-wanted:openUI:client')
AddEventHandler('rsg-wanted:openUI:client', function(date, reason, description, reward, image)
    SendNUIMessage({
        action = "openNormal",
        date = date,
        reason = reason,
        description = description,
        reward = reward,
        image = image,
    })
    SetNuiFocus(true,true)
end)

RegisterNetEvent('rsg-wanted:openEditor')
AddEventHandler('rsg-wanted:openEditor', function()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job and (PlayerData.job.name == "police" or PlayerData.job.type == "leo") then
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = 'openNormalEditor',
            })
        else
            
            TriggerEvent('rNotify:NotifyLeft', "YOU ARE NOT THE SHERIFF", "NO ACCESS", "generic_textures", "tick", 4000)
        end
    end)
end)



RegisterNUICallback('updateData', function(data)
    TriggerServerEvent('rsg-wanted:dataYenile', data.dateData, data.reasonData, data.descData, data.rewardData, data.imageData)
end)

RegisterNUICallback('exit', function()
	SetNuiFocus(false, false)
end)