local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	{
		"folke/lazy.nvim",
		tag = "stable"
	},
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{
		"EtiamNullam/deferred-clipboard.nvim",
		config = function()
			require('deferred-clipboard').setup {
				-- fallback = 'unnamedplus',
				-- force_init_unnamed = true,
			}
		end,
	},

	-- TEXT plugins

	{
		"rmagatti/alternate-toggler",
		config = function()
			require("user.text")
		end
	},
	{ "m4xshen/autoclose.nvim" },
	{ "mg979/vim-visual-multi" },
	{ "tpope/vim-surround" },
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- Color Schemes
	{ "folke/tokyonight.nvim",    enabled = false },
	{ "ellisonleao/gruvbox.nvim", enabled = false },
	{ "shaunsingh/nord.nvim",     enabled = false },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require "user.colorschemes"
		end
	},

	-- MARKDOWN
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		dependencies = { "iamcco/mathjax-support-for-mkdp" },
	},
	{
		'dkarter/bullets.vim',
		ft = { "markdown" },
	},

	-- Latex
	{
		"lervag/vimtex",
		ft = { 'tex' },
		config = function()
			require('user.vimtex')
		end,
	},

	-- documentation
	{
		"danymat/neogen",
		config = function()
			require('neogen').setup {}
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
		version = "*"
	},

	-- COMPLETIONS
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.cmp")
		end,
		dependencies = {
			"cmp-nvim-lsp",
			"cmp_luasnip",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
			"cmp-nvim-lua",
			"cmp-nvim-lsp-signature-help",
		},
	},
	{ "hrsh7th/cmp-buffer",                  lazy = true },
	{ "hrsh7th/cmp-path",                    lazy = true },
	{ "hrsh7th/cmp-cmdline",                 lazy = true },
	{ "hrsh7th/cmp-nvim-lsp",                lazy = true },
	{ "hrsh7th/cmp-nvim-lua",                lazy = true },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },

	-- Snippets
	{ "saadparwaiz1/cmp_luasnip",            lazy = true },
	{
		"L3MON4D3/LuaSnip",
		event = { "InsertEnter" },
		dependencies = { "friendly-snippets" }
	},
	{ "rafamadriz/friendly-snippets", lazy = true },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		-- cmd = {
		-- 	"Mason",
		-- 	"MasonInstall",
		-- 	"MasonUninstall",
		-- 	"MasonUninstallAll",
		-- 	"MasonLog",
		-- },
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},

	-- TERMINAL
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.toggleterm")
		end
	},

	-- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = { "Telescope" },
	},

	-- TREESITTER
	{
		"nvim-treesitter/nvim-treesitter",
		-- run =  ':TSUpdate',
		config = function()
			require "user.treesitter"
		end,
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
		event = "User FileOpened",
		lazy = "false",
		version = nil,
	},

	-- STATUS LINE
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require("user.lualine");
		end
	},

	-- WhichKey
	{
		"folke/which-key.nvim",
		config = function()
			require("user.whichkey")
		end,
	},

	-- StartUP screen
	{
		"startup-nvim/startup.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup()
		end
	},


	{ "nvim-treesitter/playground" },
	-- COMMENTS
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	-- GIT
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},

	-- neo-Tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = { "NvimTreeToggle" },
		config = function()
			require("user.nvimtree")
		end
	},
	-- Code Runner
	{
		"CRAG666/code_runner.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		ft = { "cpp" },
		config = function()
			require "user.code_runner"
		end
	},

	{
		"echasnovski/mini.indentscope",
		config = function()
			require("user.indent_scope")
		end
	},

	-- TESTCASE MANAGER
	{
		"xeluxee/competitest.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config       = function()
			require "user.competitest"
		end
	},


	-- Styles
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{ 'stevearc/dressing.nvim' },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("user.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- tmux
	{ 'christoomey/vim-tmux-navigator' },
}

require('lazy').setup(plugins)




-- -- vim.cmd [[
-- -- 	augroup packer_user_config
-- -- 		autocmd!
-- -- 		autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- -- 	augroup end
-- -- ]]
