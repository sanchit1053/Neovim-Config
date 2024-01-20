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
			}
		end,
	},

	-- TEXT plugins
	{
		"rmagatti/alternate-toggler",
		cmd = "ToggleAlternate",
		config = function()
			require("user.text")
		end
	},
	{ "mg979/vim-visual-multi", enabled = false },
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
	{ "ramojus/mellifluous.nvim", enabled = false },
	{ "rebelot/kanagawa.nvim",    enabled = true },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require "user.colorschemes"
		end
	},

	-- MARKDOWN
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			vim.cmd [[
				function OpenMarkdownPreview (url)
					execute "silent ! /mnt/c/Program\\ Files/Google/Chrome/Application/chrome.exe " . a:url
				endfunction
				let g:mkdp_browserfunc = 'OpenMarkdownPreview'
			]]
		end,
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
		cmd = "Neogen",
		config = function()
			require('neogen').setup {}
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
		version = "*"
	},

	-- COMPLETIONS
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("user.cmp")
		end,
		dependencies = {
			"cmp-nvim-lsp",
			"cmp-buffer",
			"cmp-path",
			"cmp_luasnip",
			"cmp-nvim-lsp-signature-help",
		},
	},
	{ "hrsh7th/cmp-buffer",                  lazy = true },
	{ "hrsh7th/cmp-path",                    lazy = true },
	{ "hrsh7th/cmp-nvim-lsp",                lazy = true },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },

	-- Snippets
	{ "saadparwaiz1/cmp_luasnip",            lazy = true },
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" }
	},
	{ "rafamadriz/friendly-snippets"},

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},

	-- TERMINAL
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		config = function()
			require("user.toggleterm")
		end
	},

	-- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = { "Telescope" },
		config = function()
			require("user.telescope")
		end
	},
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		dependencies = { 'nvim-telescope/telescope.nvim' }
	},

	-- TREESITTER
	{
		"nvim-treesitter/nvim-treesitter",
		-- cmd = {
		-- 	"TSInstall",
		-- 	"TSUninstall",
		-- 	"TSUpdate",
		-- 	"TSUpdateSync",
		-- 	"TSInstallInfo",
		-- 	"TSInstallSync",
		-- 	"TSInstallFromGrammar",
		-- },
		build = ":TSUpdate",
		-- event = "User FileOpened",
		lazy = false,
		config = function()
			require "user.treesitter"
		end,
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
		opt = true,
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

	-- nvim-tree
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

	-- Mini
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("user.indent_scope")
		end
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function ()
			require("user.pairs")
		end,
		-- opts = {},
		-- keys = {
		-- 	{
		-- 		"<leader>up",
		-- 		function()
		-- 			vim.g.minipairs_disable = not vim.g.minipairs_disable;
		-- 		end,
		-- 		desc = "Toggle auto [p]air"
		-- 	}
		-- }
	},

	-- TESTCASE MANAGER
	{
		"xeluxee/competitest.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		ft           = { "cpp" },
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
		tag = "legacy",
	},
	{ 'stevearc/dressing.nvim',        lazy = true },
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

	-- rust
	{ 'simrat39/rust-tools.nvim' },

	-- vanity
	{
		'gen740/SmoothCursor.nvim',
		config = function()
			require('smoothcursor').setup()
		end
	}
}

require('lazy').setup(plugins, {
	ui = {
		border = "rounded",
	},
})
