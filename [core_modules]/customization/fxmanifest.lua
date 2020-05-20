fx_version "adamant"

games {"rdr3"}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

dependency 'GHMattiMySQL'

client_scripts {
	'cl_warmenu.lua',
	'cl_client.lua',
	'cl_female.lua',
	'cl_male.lua',
}

server_scripts {
	'sv_server.lua',
}
