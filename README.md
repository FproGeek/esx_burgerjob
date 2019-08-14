# esx_burgerjob
Ce script permet d'avoir le job BurgerShot sur son serveur gta 5 RP (fivem).

Merci de télecharger et d'installer ce mapping pour utiliser burgershot.
https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem

# Script Requiert
Mapping burgershot => https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem  (merci a Smallo)

esx_society => https://github.com/ESX-Org/esx_society

esx_billing => https://github.com/ESX-Org/esx_billing

esx_status => https://github.com/ESX-Org/esx_status

esx_basicneeds => https://github.com/ESX-Org/esx_basicneeds

esx_optionalsneeds => https://github.com/ESX-Org/esx_optionalneeds

# Installation
1) Ajouter ce mapping sur votre serveur : https://www.gta5-mods.com/maps/gtaiv-burgershot-interior-sp-and-fivem, oubliez pas de marquer le dossier dans server.cfg.
2) Ouvrez l'archive "esx_burgershot 1.1.0"
3) Placer le dossier "esx_burgershot" dans /[esx]
4) Importer esx_burgersho.sql dans votre base de donnée
5) Ajouter cette ligne dans votre server.cfg : start esx_burgerjob

# Manger l'hamburger
Pour rendre possible le pouvoir de manger son hamburger, vous devez vous rendre dans esx_basicneeds puis dans /server/main.lua et ajouter : 

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_burger'))
end)

merci
