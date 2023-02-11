-- :help options

local opt = vim.opt

opt.backup = false
opt.clipboard = ""
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a" -- Always on
opt.pumheight = 10
opt.showmode = true
opt.showtabline = 2 -- 0 never 1 default 2 always
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true

opt.undofile = true
opt.updatetime = 300
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showcmd = true
-- opt.cc = "72"

opt.termguicolors = true
opt.list = true


opt.timeoutlen = 500


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
