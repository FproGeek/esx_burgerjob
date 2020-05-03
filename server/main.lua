print("^0======================================================================^7")
print("^3Copyright 2019-2020 esx_burgerjob ^5V2.0 ^3by ^1FproGeek^0")
print("^5https://github.com/FproGeek/esx_burgerjob^0")
print("^0======================================================================^7")

ESX                = nil
local PlayersTransforming, PlayersSelling, PlayersHarvesting = {}, {}, {}
local ketchup = 1

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'burgershot', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'burgershot', _U('burgershot_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'burgershot', 'burgershot', 'society_burgershot', 'society_burgershot', 'society_burgershot', {type = 'private'})

local function Harvest(source, zone)
  if PlayersHarvesting[source] == true then

    local xPlayer  = ESX.GetPlayerFromId(source)
    if zone == "KetchupFarm" then
      local itemQuantity = xPlayer.getInventoryItem('caisseketchup').count
      if itemQuantity >= 40 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_enough_place')) 
        return
      else
        SetTimeout(1800, function()
          xPlayer.addInventoryItem('caisseketchup', 1)
          Harvest(source, zone)
        end)
      end
    end
  end
end

RegisterServerEvent('esx_burgerjob:startHarvest')
AddEventHandler('esx_burgerjob:startHarvest', function(zone)
  local _source = source
    
  if PlayersHarvesting[_source] == false then
    TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
    PlayersHarvesting[_source]=false
  else
    PlayersHarvesting[_source]=true
    TriggerClientEvent('esx:showNotification', _source, _U('ketchup_taken'))  
    Harvest(_source,zone)
  end
end)

RegisterServerEvent('esx_burgerjob:stopHarvest')
AddEventHandler('esx_burgerjob:stopHarvest', function()
  local _source = source
  
  if PlayersHarvesting[_source] == true then
    PlayersHarvesting[_source]=false
    TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
  else
    TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récupérer les caisses')
    PlayersHarvesting[_source]=true
  end
end)

local function Transform(source, zone)

  if PlayersTransforming[source] == true then

    local xPlayer  = ESX.GetPlayerFromId(source)
    if zone == "SachetKetchup" then
      local itemQuantity = xPlayer.getInventoryItem('caisseketchup').count

      if itemQuantity <= 0 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_enough_caisseketchup'))
        return
      else
          SetTimeout(1800, function()
            xPlayer.removeInventoryItem('caisseketchup', 1)
            xPlayer.addInventoryItem('sachetketchup', 10)
            Transform(source, zone)
          end)
        end
      end
      end
    end

RegisterServerEvent('esx_burgerjob:startTransform')
AddEventHandler('esx_burgerjob:startTransform', function(zone)
  local _source = source
    
  if PlayersTransforming[_source] == false then
    TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
    PlayersTransforming[_source]=false
  else
    PlayersTransforming[_source]=true
    TriggerClientEvent('esx:showNotification', _source, _U('sachet_in_progress')) 
    Transform(_source,zone)
  end
end)

RegisterServerEvent('esx_burgerjob:stopTransform')
AddEventHandler('esx_burgerjob:stopTransform', function()
  local _source = source
  
  if PlayersTransforming[_source] == true then
    PlayersTransforming[_source]=false
    TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    
  else
    TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~mettre en sachet votre ketchup')
    PlayersTransforming[_source]=true
  end
end)

local function Sell(source, zone)

  if PlayersSelling[source] == true then
    local xPlayer  = ESX.GetPlayerFromId(source)
    
    if zone == 'SellFarm' then
      if xPlayer.getInventoryItem('sachetketchup').count <= 0 then
        xPlayer.showNotification(_U('no_sachet_sale'))
        ketchup = 0
        return
      else
        if (ketchup == 1) then
          SetTimeout(1100, function()
            local moneysociety = math.random(4,6)
            local money = math.random(2,3)
            xPlayer.removeInventoryItem('sachetketchup', 1)
            xPlayer.addMoney(money)
              TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned_private') .. money)
            local societyAccount = nil

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
              societyAccount = account
            end)
            if societyAccount ~= nil then
              societyAccount.addMoney(moneysociety)
              TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. moneysociety)
            end
            Sell(source,zone)
          end)
        end
      end
    end
  end
end

RegisterServerEvent('esx_burgerjob:startSell')
AddEventHandler('esx_burgerjob:startSell', function(zone)
  local _source = source

  if PlayersSelling[_source] == false then
    TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
    PlayersSelling[_source]=false
  else
    PlayersSelling[_source]=true
    TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
    Sell(_source, zone)
  end
end)

RegisterServerEvent('esx_burgerjob:stopSell')
AddEventHandler('esx_burgerjob:stopSell', function()
  local _source = source
  
  if PlayersSelling[_source] == true then
    PlayersSelling[_source]=false
    TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
    
  else
    TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
    PlayersSelling[_source]=true
  end
end)

RegisterServerEvent('esx_burgerjob:getStockItem')
AddEventHandler('esx_burgerjob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_burgerjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_burgerjob:putStockItems')
AddEventHandler('esx_burgerjob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_burgerjob:getFridgeStockItem')
AddEventHandler('esx_burgerjob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_burgerjob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_burgerjob:putFridgeStockItems')
AddEventHandler('esx_burgerjob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_burgerjob:buyItem')
AddEventHandler('esx_burgerjob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_fric'))
    end

end)


RegisterServerEvent('esx_burgerjob:ingredientgBurger')
AddEventHandler('esx_burgerjob:ingredientgBurger', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_ingredient'))

 if _itemValue == 'cuttomate' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('tomater').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomater') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('term_miss'))
                    xPlayer.removeInventoryItem('tomater', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('tomatec') .. _U(' term') .. ' ~w~!')
                    xPlayer.removeInventoryItem('tomater', 1)
                    xPlayer.addInventoryItem('tomatec', 5)
                end
            end

        end)
    end

     if _itemValue == 'lavesalade' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('salads').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('salads') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('term_miss'))
                    xPlayer.removeInventoryItem('salads', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('saladp') .. _U(' term') .. ' ~w~!')
                    xPlayer.removeInventoryItem('salads', 1)
                    xPlayer.addInventoryItem('saladp', 5)
                end
            end

        end)
    end

         if _itemValue == 'cuiresteak' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('steakc').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('steakc') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('term_miss'))
                    xPlayer.removeInventoryItem('steakc', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('steakcui') .. _U(' term') .. ' ~w~!')
                    xPlayer.removeInventoryItem('steakc', 1)
                    xPlayer.addInventoryItem('steakcui', 1)
                end
            end

        end)
    end

             if _itemValue == 'friteuse' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('patate').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('patate') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('term_miss'))
                    xPlayer.removeInventoryItem('patate', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('patatefrie') .. _U(' term') .. ' ~w~!')
                    xPlayer.removeInventoryItem('patate', 1)
                    xPlayer.addInventoryItem('patatefrie', 1)
                end
            end

        end)
    end

end)

RegisterServerEvent('esx_burgerjob:craftingBurger')
AddEventHandler('esx_burgerjob:craftingBurger', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_burger'))

 if _itemValue == 'burger' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('bread').count
            local bethQuantity      = xPlayer.getInventoryItem('fromage').count
            local gimelQuantity     = xPlayer.getInventoryItem('tomatec').count
            local daletQuantity     = xPlayer.getInventoryItem('saladp').count
            local gameQuantity     = xPlayer.getInventoryItem('steakcui').count 

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bread') .. '~w~')
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            elseif gimelQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomatec') .. '~w~')
            elseif daletQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saladp') .. '~w~')
            elseif gameQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('steakcui') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('bread', 2)
                    xPlayer.removeInventoryItem('fromage', 2)
                    xPlayer.removeInventoryItem('tomatec', 2)
                    xPlayer.removeInventoryItem('saladp', 2)
                    xPlayer.removeInventoryItem('steakcui', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('burger') .. _U(' craft') .. ' ~w~!')
                    xPlayer.removeInventoryItem('bread', 2)
                    xPlayer.removeInventoryItem('fromage', 2)
                    xPlayer.removeInventoryItem('tomatec', 2)
                    xPlayer.removeInventoryItem('saladp', 2)
                    xPlayer.removeInventoryItem('steakcui', 1)
                    xPlayer.addInventoryItem('burger', 1)
                end
            end

        end)
    end

     if _itemValue == 'fritesba' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('patatefrie').count 

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('patatefrie') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('patatefrie', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('frites') .. _U(' craft') .. ' ~w~!')
                    xPlayer.removeInventoryItem('patatefrie', 1)
                    xPlayer.addInventoryItem('frites', 1)
                end
            end

        end)
    end

end)


ESX.RegisterServerCallback('esx_burgerjob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_burgershot', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_burgerjob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_burgershot', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_burgerjob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_burgershot', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_burgerjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

ESX.RegisterUsableItem('burger', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('burger', 1)

TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
TriggerClientEvent('esx_basicneeds:onEat', source)
TriggerClientEvent('esx:showNotification', source, _U('used_burger'))
end)

ESX.RegisterUsableItem('frites', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('frites', 1)

TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
TriggerClientEvent('esx_basicneeds:onEat', source)
TriggerClientEvent('esx:showNotification', source, _U('used_frites'))
end)

ESX.RegisterUsableItem('soda', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('soda', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_soda'))
end)

ESX.RegisterUsableItem('icetea', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('icetea', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_icetea'))
end)

ESX.RegisterUsableItem('jusfruit', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('jusfruit', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_jusfruit'))
end)

ESX.RegisterUsableItem('limonade', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('limonade', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_limonade'))
end)

ESX.RegisterUsableItem('drpepper', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('drpepper', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_drpepper'))
end)

ESX.RegisterUsableItem('energy', function(source)
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem('energy', 1)

TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
TriggerClientEvent('esx_basicneeds:onDrink', source)
TriggerClientEvent('esx:showNotification', source, _U('used_energy'))
end)
