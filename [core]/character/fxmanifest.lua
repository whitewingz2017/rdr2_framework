fx_version 'adamant'
game 'gta5'

dependency 'GHMattiMySQL'

shared_scripts {
	'sh_character.lua',
}

client_scripts {
	'cl_character.lua',
	'cl_switcher.lua',
}

server_scripts {
	'sv_character.lua',
	'sv_modules.lua',
}