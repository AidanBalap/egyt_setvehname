fx_version 'adamant'

game 'gta5'

author 'ElGammaYT'

description 'ESX - Load all vehicle names of the vehicleshop table'

client_scripts {
	'client/main.lua',
	'config.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}

dependency 'esx_vehicleshop'