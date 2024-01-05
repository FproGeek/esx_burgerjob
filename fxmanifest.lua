fx_version 'cerulean'
game 'gta5'

description 'ESX BurgerJob'
author 'FproGeek'
version '2.0.1'

shared_script '@es_extended/imports.lua'

client_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'server/main.lua'
}
