fx_version 'adamant'
game 'gta5'


version '1.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua',
	'server/food.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

ui_page {
	'ui/index.html'
}
  
  files {
	'ui/index.html',
	'ui/style.css',
}