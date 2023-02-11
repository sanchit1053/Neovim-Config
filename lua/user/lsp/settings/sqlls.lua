local util = require 'lspconfig.util'

return {
	default_config = {
		cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
		filetypes = { 'sql', 'mysql' },
		root_dir = '~/.config/nvim/lua/sanchit1053/lsp/settings/sqlls.json',
		settings = {},
	},
	docs = {
		description = [[
https://github.com/joe-re/sql-language-server
HELLO sanchit1053
This LSP can be installed via  `npm`. Find further instructions on manual installation of the sql-language-server at [joe-re/sql-language-server](https://github.com/joe-re/sql-language-server).
<br>
    ]],
	},
}
