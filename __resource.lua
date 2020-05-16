resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'RPCHAT - Made By TypicalChick#0001, Nevo#2020, Agam#4305'

version '1.3.1'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/sv.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/cs.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/sv.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/cs.lua',
	'config.lua',
	'client/main.lua',
}

dependency 'es_extended'
