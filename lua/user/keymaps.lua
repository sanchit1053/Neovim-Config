local NVIMCONFIG = NVIMCONFIG
local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

local function map(mode, lhs, rhs, newopts)
	local options = opts
	if newopts then
		options = vim.tbl_extend("force", options, newopts)
	end
	keymap(mode, lhs, rhs, options)
end


function NVIMCONFIG.setKeyMaps(keymaps)
	for _, v in ipairs(keymaps) do
		if #v == 3 then
			map(v[1], v[2], v[3])
		else
			map(v[1], v[2], v[3], v[4])
		end
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
	{ "n", "<leader>e",  ":NvimTreeToggle<cr>",               { desc = "fil[e] explorer" } },

	-- Clear Highlight
	{ "n", "<leader>c",  ":noh<cr>",                          { desc = "[c]lear highlights" } },

	-- Find And Replace
	{ "n", "<C-n>",      "*``cgn" },
	{ "n", "<C-m>",      "*``cgN" },


	-- Resize in split
	{ "n", "<C-Up>",     ":resize +2<cr>" },
	{ "n", "<C-Down>",   ":resize -2<cr>" },
	{ "n", "<C-Left>",   ":vertical resize, -2<cr>" },
	{ "n", "<C-Right>",  ":vertical resize +2<cr>" },

	-- Navigating buffers
	{ "n", "<leader>]",  ":bnext<cr>",                        { desc = "next buffer" } },
	{ "n", "<leader>[",  ":bprevious<cr>",                    { desc = "previous buffer" } },

	-- Save and quit
	{ "n", "<leader>q",  ":q<cr>",                            { desc = "[q]uit" } },
	{ "n", "<leader>Q",  ":q!<cr>",                           { desc = "force [Q]uit" } },
	{ "n", "<leader>s",  ":w<cr>",                            { desc = "[s]ave" } },


	-- Code Runner
	{ "n", "<leader>rc", ":RunCode<cr>",                      { desc = "[r]un [c]ode" } },
	{ "n", "<leader>rq", ":RunClose<cr>",                     { desc = "[r]un [q]uit" } },

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

	-- VISUAL

	{ "v", "<A-l>",      ">gv" },
	{ "v", "<A-h>",      "<gv" },

	{ "v", "<A-j>",      ":m '>+1<cr>gv=gv" },
	{ "v", "<A-k>",      ":m '<-2<cr>gv=gv" },
	{ "v", "p",          "\"_dP" },


	-- Telescope
	{ "n", "<leader>tf", "<cmd>Telescope find_files<cr>",     { desc = "[t]elescope [f]iles" } },
	{ "n", "<leader>tw", "<cmd>Telescope live_grep<cr>",      { desc = "[t]elescope [w]ords" } },
	{ "n", "<leader>tb", "<cmd>Telescope buffers<cr>",        { desc = "[t]elescope [b]uffers" } },

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

NVIMCONFIG.setKeyMaps(generalKeymaps)
