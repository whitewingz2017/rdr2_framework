fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

ui_page {
    'html/ui.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
}

client_scripts {
	'client/main.lua'
}

exports {
	'DoShortHudText',
	'DoHudText',
	'DoLongHudText',
	'DoCustomHudText',
}