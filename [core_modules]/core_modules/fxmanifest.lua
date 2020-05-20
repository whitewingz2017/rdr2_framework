fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

client_scripts {
    'clothingstore/cl_client.lua',
    'clothingstore/sh_config.lua',
    'emotes/cl_client.lua',
    'generalstore/cl_client.lua'
    'gui/cl_menus.lua',
    'gui/cl_warmenu.lua',
    'gunsmith/cl_client.lua',
    'hunting/cl_client.lua',
    'stables/cl_client.lua',
    'stables/sh_config.lua',
    'train/cl_client.lua',
    'train/sh_config.lua',
    'utilities/sh_natives',
}

server_scripts {
    'clothingstore/sh_config.lua',
    'gunsmith/sv_server.lua',
    'hunting/sv_server.lua',
    'stables/sh_config.lua',
    'stables/sv_config.lua',
    'train/sh_confia.lua',
    'utilities/sh_natives',
}
