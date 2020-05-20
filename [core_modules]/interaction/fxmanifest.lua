fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

files {
	'html/**/*.html',
	'html/**/*.css',
	'html/**/*.js',
}

-- shared_script {
-- 	'sh_config.lua',
-- 	'sh_interaction.lua',
-- }

client_scripts {
	'cl_interaction.lua',
}

-- server_scripts {
-- 	'sv_interaction.lua',
-- }