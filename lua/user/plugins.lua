local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	print "Installing Packer | close and reopen nvim"
	vim.cmd [[ packadd packer.nvim ]]
end

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init {
	profile = {
		enable = true,
		threshold = 0,
	},
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end
	},
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	use "dstein64/vim-startuptime"
	use {
		"EtiamNullam/deferred-clipboard.nvim",
		config = function()
			require('deferred-clipboard').setup {
				-- fallback = 'unnamedplus',
				-- force_init_unnamed = true,
			}
		end
	}

	-- TEXT plugins
	use "rmagatti/alternate-toggler"
	use "m4xshen/autoclose.nvim"
	use "mg979/vim-visual-multi"
	use "gcmt/wildfire.vim"
	use "tpope/vim-surround"
	use "ggandor/leap.nvim"

	-- ColorSchemes
	-- use "folke/tokyonight.nvim"
	-- use "ellisonleao/gruvbox.nvim"
	-- use "shaunsingh/nord.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }

	-- MARKDOWN
	use({
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		run = function() vim.fn["mkdp#util#install"]() end,
		requires = "iamcco/mathjax-support-for-mkdp"
	})
	use {
		'dkarter/bullets.vim',
		ft = { "markdown" },
	}

	-- Latex
	use "lervag/vimtex"

	-- COMPLETIONS
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- Snippets
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	--[[ use {
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		-- branch = '0.7-compat',
		requires = { "nvim-lua/plenary.nvim" },
	} ]]

	-- TELESCOPE
	use {
		"nvim-telescope/telescope.nvim",
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } },
		cmd = { 'Telescope' }
	}

	-- TREESITTER
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate'
	}

	-- STATUS LINE
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- WhichKey
	use {
		"folke/which-key.nvim",
		config = function()
			require("user.whichkey")
		end,
	}

	-- StartUP screen
	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup()
		end
	}


	use "p00f/nvim-ts-rainbow"
	use "nvim-treesitter/playground"

	-- COMMENTS
	use {
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	}

	-- GIT
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	}

	-- neo-Tree
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}


	-- CokeLine TABS
	use {
		"noib3/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons",
	}


	-- Code Runner
	use {
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		ft = { "cpp" },
	}

	-- mini animate and line on scope
	-- use {
	-- 	"echasnovski/mini.animate",
	-- 	config = function ()
	-- 		require('mini.animate').setup()
	-- 	end
	-- }

	use "echasnovski/mini.indentscope"

	-- TESTCASE MANAGER
	use {
		"xeluxee/competitest.nvim",
		requires = "MunifTanjim/nui.nvim",
	}

	-- Templates
	-- use {
	-- 	"glepnir/template.nvim"
	-- }
	--

	-- Styles
	use "j-hui/fidget.nvim"
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
