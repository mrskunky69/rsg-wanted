fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

name 'wanted'
author 'NProbleM AND ADAPTED BY PHIL'
version '1.0'

ui_page "nui/index.html"
files {
    "nui/index.html",
    "nui/script.js",
    "nui/style.css",
    "nui/*.png",
}

client_scripts {
    "config.lua",
    "client/main.lua",
    "client/functions.lua"
}

server_scripts {
    "config.lua",
    "server/main.lua",
	'@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
    "config.lua",
    "client/main.lua",
    "client/functions.lua",
    "server/main.lua",
}