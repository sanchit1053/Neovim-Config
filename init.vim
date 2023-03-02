set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc



lua << EOF

-- vim.g.clipboard = {
-- 	name = "win32yank-wsl",
-- 	copy = {
-- 		["+"] = "win32yank.exe -i --crlf",
-- 		["*"] = "win32yank.exe -i --crlf"
-- 		},
-- 	paste = {
-- 		["+"] = "win32yank.exe -o --crlf",
-- 		["*"] = "win32yank.exe -o --crlf"
-- 		},
-- 	cache_enabled = 0
-- }

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.lsp"
EOF

