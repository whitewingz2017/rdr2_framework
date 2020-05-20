fx_version 'adamant'
game 'gta5'

ui_page ''

files {

}

dependencies {
	'user',
}

shared_script {
	'sh_config.lua',
}

client_scripts {
	'cl_admin-tools.lua',
	'cl_noclip.lua',
	'cl_debugger.lua',
}

server_scripts {
	'sv_config.lua',
	'sv_admin-tools.lua',
}