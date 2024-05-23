
local IsUiOpen = false

Citizen.CreateThread(function ()
    while true do

        if IsControlJustReleased(1, 51) then
            OpenUi()
        end

        Citizen.Wait(0)
    end
end)

function OpenUi()
    if not IsUiOpen then
        IsUiOpen = true
        SetNuiFocus(true, true)
        SendNuiMessage(json.encode{action = 'open'})
    else
        IsUiOpen = false
        SetNuiFocus(false, false)
        SendNuiMessage(json.encode{action = 'close'})
    end
end

RegisterNuiCallback('closeall', function ()
    if IsUiOpen then
        OpenUi()
    end
end)

RegisterNuiCallback('ExitVehicle', function ()
    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local car = CreateVehicle(GetHashKey('pounder'), coords.x, coords.y, coords.z, GetEntityHeading(ped), false, false)


    RequestModel('pounder')

    while not HasModelLoaded('pounder') do
        Citizen.Wait(10)
    end

    while not DoesEntityExist(car) do
        Citizen.Wait(10)
    end

    TaskWarpPedIntoVehicle(ped, car, -1)

end)