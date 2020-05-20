resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependencies {
	'GHMattiMySQL'
}

shared_scripts {
	'sh_config.lua',
	'sh_user.lua',
}

client_scripts {
	'cl_user.lua',
}

server_scripts {
	'sv_user.lua',
}