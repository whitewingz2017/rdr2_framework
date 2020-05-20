fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/js/config.default.js',
	'html/js/config.js',
	'html/js/App.js',
	'html/js/Message.js',
	'html/js/Suggestions.js',
	'html/vendor/vue.2.3.3.min.js',
	'html/vendor/flexboxgrid.6.3.1.min.css',
	'html/vendor/animate.3.5.2.min.css',
	'html/vendor/latofonts.css',
	'html/vendor/fonts/LatoRegular.woff2',
	'html/vendor/fonts/LatoRegular2.woff2',
	'html/vendor/fonts/LatoLight2.woff2',
	'html/vendor/fonts/LatoLight.woff2',
	'html/vendor/fonts/LatoBold.woff2',
	'html/vendor/fonts/LatoBold2.woff2',
	'html/css/style.css',
	'html/assets/hud_menu_4a.png',
}

client_scripts {
	'cl_chat.lua',
}

server_scripts {
	'sv_main.lua',
	'sv_chat.lua',
	'sv_utils.lua',
	'sv_commands.lua',
}