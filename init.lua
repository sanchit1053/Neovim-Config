vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf"
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf"
	},
	cache_enabled = 0
}

NVIMCONFIG = {}

require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"
require "user.lsp"
