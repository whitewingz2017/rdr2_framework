fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
dependency 'GHMattiMySQL'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/assets/bootstrap/css/bootstrap.min.css',
	'html/assets/bootstrap/js/bootstrap.min.js',
	'html/assets/js/jquery.min.js',
	'html/assets/js/moment.js',
	'html/assets/js/moment-duration-format.js',
	'html/assets/js/script.js',
	'html/assets/css/styles.css',
    'html/assets/img/servericon.png',
    'html/assets/img/oldpaper.jpg',
    'html/assets/fonts/BilboSwashCaps.otf',
	'html/assets/fonts/FontAwesome.otf',
	'html/assets/fonts/fontawesome-webfont.eot',
	'html/assets/fonts/fontawesome-webfont.svg',
	'html/assets/fonts/fontawesome-webfont.ttf',
	'html/assets/fonts/fontawesome-webfont.woff',
	'html/assets/fonts/fontawesome-webfont.woff2',
	'html/assets/fonts/font-awesome.css',
}

client_scripts {
	'client/main.lua',
	'client/commands.lua',
}

server_scripts {
	'server/main.lua',
	'server/character.lua',
	'server/exports.lua',
	'server/callback.lua',
	'server/commands.lua',
}

export 'GetCharacterName'