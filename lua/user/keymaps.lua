local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function map(mode, lhs, rhs, newopts)
	local options = opts
	if newopts then
		options = vim.tbl_expand("force", options, newopts)
	end
	keymap(mode, lhs, rhs, options)
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Resize in split
map("n", "<C-Up>", ":resize +2<cr>")
map("n", "<C-Down>", ":resize -2<cr>")
map("n", "<C-Left>", ":vertical resize -2<cr>")
map("n", "<C-Right>", ":vertical resize +2<cr>")

-- Navigating buffers
map("n", "<leader>]", ":bnext<cr>")
map("n", "<leader>[", ":bprevious<cr>")


-- Remove Arrows
map("n", "<Up>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Left>", "<NOP>")
map("n", "<Right>", "<NOP>")

-- Save and quit
map("n", "<leader>q", ":q<cr>")
map("n", "<leader>Q", ":q!<cr>")
map("n", "<leader>s", ":w<cr>")


-- Code Runner
map("n", "<leader>r", ":RunCode<cr>")
map("n", "<leader>rc", ":RunClose<cr>")

-- TestCaseManager
map("n", "<A-q>", ":CompetiTestRun<cr>")
map("n", "<A-a>", ":CompetiTestAdd<cr>")
map("n", "<A-d>", ":CompetiTestDelele<cr>")
map("n", "<A-e>", ":CompetiTestEdit<cr>")
map("n", "<A-r>", ":CompetiTestReceive testcases<cr>")


-- INSERT MODE

map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

map("i", "<Up>", "<NOP>")
map("i", "<Down>", "<NOP>")
map("i", "<Left>", "<NOP>")
map("i", "<Right>", "<NOP>")



map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
-- VISUAL

map("v", "<A-l>", ">gv")
map("v", "<A-h>", "<gv")

map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")
map("v", "p", "_dP")


-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>")
map("n", "<c-t>", "<cmd>Telescope live_grep<cr>")
map("n", "<c-b>", "<cmd>Telescope buffers<cr>")
