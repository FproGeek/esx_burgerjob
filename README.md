# esx_burgerjob 1.2.0
Ce script permet d'avoir le job BurgerShot sur son serveur gta 5 RP (fivem).

[! [] (http://img.youtube.com/vi/a4xZCacduKo/0.jpg)] (http://www.youtube.com/watch?v=a4xZCacduKo "")

### ZONE DE BASE:

-Vestiaire

-Coffre

-Menu patron

-Frigo 

-Garage véhicule

### MENU F6:

-Menu Facture.

-Menu préparation (couper tomate, cuire steak, mettre patate dans la friteuse, laver la salade).

-Menu Cuisiner (Cuisiner un Hamburger, une barquette de frites).

# Script Requiert
Mapping burgershot => https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem  (merci a Smallo)

esx_society => https://github.com/ESX-Org/esx_society

esx_billing => https://github.com/ESX-Org/esx_billing

esx_status => https://github.com/ESX-Org/esx_status

esx_basicneeds => https://github.com/ESX-Org/esx_basicneeds

esx_optionalsneeds => https://github.com/ESX-Org/esx_optionalneeds

# Installation
1) Ajouter ce mapping sur votre serveur : https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem, oubliez pas de marquer le dossier dans server.cfg.
2) Ouvrez l'archive "esx_burgerjob"
3) Placer le dossier "esx_burgerjob" dans /[esx]
4) Importer esx_burgerjob.sql dans votre base de donnée
5) Ajouter cette ligne dans votre server.cfg : ensure esx_burgerjob

# Manger l'hamburger, les frites et les boissons.
Pour rendre possible le pouvoir de manger son hamburger et ses frites ainsi que boire le soda etc.. , vous devez vous rendre dans esx_basicneeds puis dans /server/main.lua et ajouter : 

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
