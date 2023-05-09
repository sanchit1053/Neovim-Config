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
		run = function() vim.fn["mkdp#util#install"]() end,
		dependencies = { "iamcco/mathjax-support-for-mkdp" }
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
		requires = "nvim-treesitter/nvim-treesitter",
		version = "*"
	},

	-- COMPLETIONS
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.cmp")
		end,
		ft = { "cpp" },
		dependencies = {
			"cmp-nvim-lsp",
			"cmp_luasnip",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
			"cmp-nvim-lua",
		},
	},
	{ "hrsh7th/cmp-buffer",       lazy = true },
	{ "hrsh7th/cmp-path",         lazy = true },
	{ "hrsh7th/cmp-cmdline",      lazy = true },
	{ "hrsh7th/cmp-nvim-lsp",     lazy = true },
	{ "hrsh7th/cmp-nvim-lua",     lazy = true },

	-- Snippets
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
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
	},

	-- STATUS LINE
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
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
	{ 'christoomey/vim-tmux-navigator' },
}

require('lazy').setup(plugins)


































-- local fn = vim.fn
--
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	PACKER_BOOTSTRAP = fn.system {
-- 		"git",
-- 		"clone",
-- 		"--depth",
-- 		"1",
-- 		"https://github.com/wbthomason/packer.nvim",
-- 		install_path
-- 	}
-- 	print "Installing Packer | close and reopen nvim"
-- 	vim.cmd [[ packadd packer.nvim ]]
-- end
--
-- -- vim.cmd [[
-- -- 	augroup packer_user_config
-- -- 		autocmd!
-- -- 		autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- -- 	augroup end
-- -- ]]
--
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
-- 	return
-- end
--
-- packer.init {
-- 	profile = {
-- 		enable = true,
-- 		threshold = 0,
-- 	},
-- 	display = {
-- 		open_fn = function()
-- 			return require("packer.util").float { border = "rounded" }
-- 		end
-- 	},
-- }
--
-- return packer.startup(function(use)
-- 	use "wbthomason/packer.nvim"
-- 	use "nvim-lua/popup.nvim"
-- 	use "nvim-lua/plenary.nvim"
--
-- 	use "dstein64/vim-startuptime"
-- 	use {
-- 		"EtiamNullam/deferred-clipboard.nvim",
-- 		config = function()
-- 			require('deferred-clipboard').setup {
-- 				-- fallback = 'unnamedplus',
-- 				-- force_init_unnamed = true,
-- 			}
-- 		end,
-- 	}
--
-- 	-- TEXT plugins
-- 	use {
-- 		"rmagatti/alternate-toggler",
-- 		config = function()
-- 			require("user.text")
-- 		end
-- 	}
-- 	use "m4xshen/autoclose.nvim"
-- 	use "mg979/vim-visual-multi"
-- 	use "gcmt/wildfire.vim"
-- 	use "tpope/vim-surround"
-- 	use {
-- 		"ggandor/leap.nvim",
-- 		config = function()
-- 			require("leap").add_default_mappings()
-- 		end,
-- 	}
--
-- 	-- ColorSchemes
-- 	-- use "folke/tokyonight.nvim"
-- 	-- use "ellisonleao/gruvbox.nvim"
-- 	-- use "shaunsingh/nord.nvim"
-- 	use {
-- 		"catppuccin/nvim",
-- 		as = "catppuccin",
-- 		config = function()
-- 			require "user.colorschemes"
-- 		end
-- 	}
--
-- 	-- MARKDOWN
-- 	use({
-- 		"iamcco/markdown-preview.nvim",
-- 		ft = { "markdown" },
-- 		run = function() vim.fn["mkdp#util#install"]() end,
-- 		requires = "iamcco/mathjax-support-for-mkdp"
-- 	})
-- 	use {
-- 		'dkarter/bullets.vim',
-- 		ft = { "markdown" },
-- 	}
--
-- 	-- Latex
-- 	use {
-- 		"lervag/vimtex",
-- 		ft = { 'tex' },
-- 		config = function()
-- 			require('user.vimtex')
-- 		end,
--
-- 	}
--
-- 	-- documentation
-- 	use {
-- 		"danymat/neogen",
-- 		config = function()
-- 			require('neogen').setup {}
-- 		end,
-- 		requires = "nvim-treesitter/nvim-treesitter",
-- 		-- Uncomment next line if you want to follow only stable versions
-- 		-- tag = "*"
-- 	}
--
-- 	-- COMPLETIONS
-- 	use {
-- 		"hrsh7th/nvim-cmp",
-- 		config = function()
-- 			require("user.cmp")
-- 		end
-- 	}
-- 	use "hrsh7th/cmp-buffer"
-- 	use "hrsh7th/cmp-path"
-- 	use "hrsh7th/cmp-cmdline"
-- 	use "hrsh7th/cmp-nvim-lsp"
-- 	use "hrsh7th/cmp-nvim-lua"
--
-- 	-- Snippets
-- 	use "saadparwaiz1/cmp_luasnip"
-- 	use "L3MON4D3/LuaSnip"
-- 	use "rafamadriz/friendly-snippets"
--
-- 	-- LSP
-- 	use "neovim/nvim-lspconfig"
-- 	use {
-- 		"williamboman/mason.nvim",
-- 		-- cmd = {
-- 		-- 	"Mason",
-- 		-- 	"MasonInstall",
-- 		-- 	"MasonUninstall",
-- 		-- 	"MasonUninstallAll",
-- 		-- 	"MasonLog",
-- 		-- },
-- 	}
-- 	use {
-- 		"williamboman/mason-lspconfig.nvim",
-- 	}
-- 	-- TERMINAL
-- 	use {
-- 		"akinsho/toggleterm.nvim",
-- 		config = function()
-- 			require("user.toggleterm")
-- 		end
-- 	}
--
-- 	-- TELESCOPE
-- 	use {
-- 		"nvim-telescope/telescope.nvim",
-- 		requires = { { 'nvim-lua/plenary.nvim' } },
-- 		cmd = { 'Telescope' }
-- 	}
--
-- 	-- TREESITTER
-- 	use {
-- 		"nvim-treesitter/nvim-treesitter",
-- 		run = ':TSUpdate',
-- 		config = function()
-- 			require "user.treesitter"
-- 		end
-- 	}
--
-- 	-- STATUS LINE
-- 	use {
-- 		'nvim-lualine/lualine.nvim',
-- 		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
-- 		config = function()
-- 			require("user.lualine");
-- 		end
-- 	}
--
-- 	-- WhichKey
-- 	use {
-- 		"folke/which-key.nvim",
-- 		config = function()
-- 			require("user.whichkey")
-- 		end,
-- 	}
--
-- 	-- StartUP screen
-- 	use {
-- 		"startup-nvim/startup.nvim",
-- 		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			require "startup".setup()
-- 		end
-- 	}
--
--
-- 	use "p00f/nvim-ts-rainbow"
-- 	use "nvim-treesitter/playground"
--
-- 	-- COMMENTS
-- 	use {
-- 		"numToStr/Comment.nvim",
-- 		config = function()
-- 			require("Comment").setup()
-- 		end
-- 	}
--
-- 	-- GIT
-- 	use {
-- 		"lewis6991/gitsigns.nvim",
-- 		config = function()
-- 			require("gitsigns").setup()
-- 		end
-- 	}
--
-- 	-- neo-Tree
-- 	use {
-- 		"nvim-tree/nvim-tree.lua",
-- 		requires = {
-- 			'nvim-tree/nvim-web-devicons',
-- 		},
-- 		cmd = {
-- 			"NvimTreeToggle"
-- 		},
-- 		config = function()
-- 			require("user.nvimtree")
-- 		end
-- 	}
--
--
-- 	-- CokeLine TABS
-- 	use "kyazdani42/nvim-web-devicons"
-- 	use {
-- 		"noib3/nvim-cokeline",
-- 		requires = "kyazdani42/nvim-web-devicons",
-- 		after = "catppuccin",
-- 		config = function()
-- 			require("user.cokeline")
-- 		end
-- 	}
--
--
-- 	-- Code Runner
-- 	use {
-- 		"CRAG666/code_runner.nvim",
-- 		requires = "nvim-lua/plenary.nvim",
-- 		ft = { "cpp" },
-- 		config = function()
-- 			require "user.code_runner"
-- 		end
-- 	}
--
-- 	-- mini animate and line on scope
-- 	-- use {
-- 	-- 	"echasnovski/mini.animate",
-- 	-- 	config = function ()
-- 	-- 		require('mini.animate').setup()
-- 	-- 	end
-- 	-- }
--
-- 	use {
-- 		"echasnovski/mini.indentscope",
-- 		config = function()
-- 			require("user.indent_scope")
-- 		end
-- 	}
--
-- 	-- TESTCASE MANAGER
-- 	use {
-- 		"xeluxee/competitest.nvim",
-- 		requires = "MunifTanjim/nui.nvim",
-- 		config = function()
-- 			require "user.competitest"
-- 		end
-- 	}
--
-- 	-- Templates
-- 	-- use {
-- 	-- 	"glepnir/template.nvim"
-- 	-- }
-- 	--
--
-- 	-- Styles
-- 	use {
-- 		"j-hui/fidget.nvim",
-- 		config = function()
-- 			require("fidget").setup()
-- 		end,
-- 	}
--
-- 	use {
-- 		"lukas-reineke/indent-blankline.nvim"
-- 	}
--
-- 	use {
-- 		'stevearc/dressing.nvim'
-- 	}
--
-- 	use 'christoomey/vim-tmux-navigator'
--
-- 	if PACKER_BOOTSTRAP then
-- 		require("packer").sync()
-- 	end
-- end)
