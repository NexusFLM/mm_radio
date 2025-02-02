local QBCore = nil
local ESX = nil


if Shared.Core == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()

    if not Shared.Ready then return end

    QBCore.Functions.CreateUseableItem(Shared.RadioItem, function(source)
        TriggerClientEvent('mm_radio:client:use', source)
    end)
elseif Shared.Core == "esx" then
    ESX = exports['es_extended']:getSharedObject()

    if not Shared.Ready then return end

    ESX.RegisterUsableItem(Shared.RadioItem, function(source)
        TriggerClientEvent('mm_radio:client:use', source)
    end)
end

function GetUserName(source)
    if Shared.Core == "qb" and QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        end
    elseif Shared.Core == "esx" and ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            if Shared.JobUsingCallsign[xPlayer.job.name] == true then
                return FormattedEsxCallsign(Player(xPlayer.source).state.callsign, xPlayer.job.grade_label)
            else
                return xPlayer.getName()
            end
            
        end
    else
        return GetPlayerName(source)
    end
end


function FormattedEsxCallsign(callsign, gradeLabel)
    if not callsign then callsign = 000 end
    return string.format("[%d] %s", callsign, gradeLabel)
end