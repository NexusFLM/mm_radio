if Shared.Inventory == "ox" then
    AddEventHandler('ox_inventory:updateInventory', function(changes)
        if Shared.Core == "esx" then
            Radio:ESXInit()
        elseif Shared.Core == "qb" then
            Radio:QBInit()
        end
    end)
end