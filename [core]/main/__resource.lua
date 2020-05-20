resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
dependency {
	'GHMattiMySQL',
	-- 'spawnmanager'
}

shared_script 'sh_main.lua'
client_script 'cl_main.lua'
server_script 'sv_main.lua'

--export 'GetIdentifier'