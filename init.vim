set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:clipboard = {
        \   'name': 'win32yank_nvim',
        \   'copy': {
        \      '+': 'win32yank.exe -i --crlf',
        \      '*': 'win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o --lf',
        \      '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 1,
        \ }

lua << EOF
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorschemes"
require "user.cmp"
require "user.lsp"
require "user.lualine"
require "user.nvimtree"
require "user.whichkey"
require "user.treesitter"
require "user.code_runner"
require "user.competitest"
require "user.text"
require "user.indent_scope"
require "user.cokeline"
require "user.vimtex"

require("fidget").setup()
require("leap").add_default_mappings()
EOF

