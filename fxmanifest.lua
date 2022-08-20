fx_version "cerulean"

description "vRP Redis"
author "Dione B."
version '1.0.0'

lua54 'yes'

games {
  "gta5"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*"
}
