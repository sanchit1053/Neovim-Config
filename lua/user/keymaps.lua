local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function map(mode, lhs, rhs, newopts)
	local options = opts
	if newopts then
		options = vim.tbl_expand("force", options, newopts)
	end
	keymap(mode, lhs, rhs, options)
end


local function setKeymaps(keymaps)
	for _, v in ipairs(keymaps) do
		map(v[1], v[2], v[3])
	end
end

function NVIMCONFIG.setBufrKeymaps(bufnr, keymaps, options)
	for _, v in ipairs(keymaps) do
		vim.api.nvim_buf_set_keymap(bufnr, v[1], v[2], v[3], options)
	end
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

local generalKeymaps = {

	-- window navigation
	{ "n", "<C-h>",      "<C-w>h" },
	{ "n", "<C-j>",      "<C-w>j" },
	{ "n", "<C-k>",      "<C-w>k" },
	{ "n", "<C-l>",      "<C-w>l" },

	-- File Explorer
	{ "n", "<leader>e",  ":NvimTreeToggle<cr>" },

	-- Resize in split
	{ "n", "<C-Up>",     ":resize +2<cr>" },
	{ "n", "<C-Down>",   ":resize -2<cr>" },
	{ "n", "<C-Left>",   ":vertical resize, -2<cr>" },
	{ "n", "<C-Right>",  ":vertical resize +2<cr>" },

	-- Navigating buffers
	{ "n", "<leader>]",  ":bnext<cr>" },
	{ "n", "<leader>[",  ":bprevious<cr>" },

	-- Save and quit
	{ "n", "<leader>q",  ":q<cr>" },
	{ "n", "<leader>Q",  ":q!<cr>" },
	{ "n", "<leader>s",  ":w<cr>" },


	-- Code Runner
	{ "n", "<leader>r",  ":RunCode<cr>" },
	{ "n", "<leader>rc", ":RunClose<cr>" },

	-- TestCaseManager
	{ "n", "<A-q>",      ":CompetiTest run<cr>" },
	{ "n", "<A-a>",      ":CompetiTest add_testcase<cr>" },
	{ "n", "<A-d>",      ":CompetiTest delele<cr>" },
	{ "n", "<A-e>",      ":CompetiTest edit_testcase<cr>" },
	{ "n", "<A-r>",      ":CompetiTest receive testcases<cr>" },


	-- Disable Arrow Keys
	{ "n", "<Up>",       "<NOP>" },
	{ "n", "<Down>",     "<NOP>" },
	{ "n", "<Left>",     "<NOP>" },
	{ "n", "<Right>",    "<NOP>" },
	-- INSERT MODE

	{ "i", "jk",         "<ESC>" },
	{ "i", "kj",         "<ESC>" },

	{ "i", "<Up>",       "<NOP>" },
	{ "i", "<Down>",     "<NOP>" },
	{ "i", "<Left>",     "<NOP>" },
	{ "i", "<Right>",    "<NOP>" },



	-- { "i", "<C-j>",      "<Down>" },
	-- { "i", "<C-k>",      "<Up>" },
	-- { "i", "<C-h>",      "<Left>" },
	-- { "i", "<C-l>",      "<Right>" },
	-- VISUAL

	{ "v", "<A-l>",      ">gv" },
	{ "v", "<A-h>",      "<gv" },

	{ "v", "<A-j>",      ":m '>+1<cr>gv=gv" },
	{ "v", "<A-k>",      ":m '<-2<cr>gv=gv" },
	{ "v", "p",          "_dP" },


	-- Telescope
	{ "n", "<leader>f",  "<cmd>Telescope find_files<cr>" },
	{ "n", "<c-t>",      "<cmd>Telescope live_grep<cr>" },
	{ "n", "<c-b>",      "<cmd>Telescope buffers<cr>" },

	-- Toggler
	{ "n", "<leader>ta", ":ToggleAlternate<cr>" },
}

NVIMCONFIG.lspKeyMaps = {

	{ "n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>" },
	{ "n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>" },
	{ "n", "<leader>k",  "<cmd>lua vim.lsp.buf.hover()<CR>" },
	{ "n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>" },
	{ "n", "<C-k>",      "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
	{ "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
	{ "n", "gr",         "<cmd>lua vim.lsp.buf.references()<CR>" },
	{ "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
	{ "n", "<leader>o",  "<cmd>lua vim.diagnostic.open_float()<CR>" },
	{ "n", "[d",         '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>' },
	{ "n", "gl",         '<cmd>lua vim.diagnostic.open_float()<CR>' },
	{ "n", "]d",         '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>' },
	{ "n", "<leader>d",  "<cmd>lua vim.diagnostic.setloclist()<CR>" },
}

setKeymaps(generalKeymaps)
