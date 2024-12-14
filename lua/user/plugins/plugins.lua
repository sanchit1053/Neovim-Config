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
		enabled = function()
			local OS = vim.fn.system("uname -r");
			return string.find(OS, "WSL");
		end
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

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
	{ "williamboman/mason-lspconfig.nvim", },

	-- tmux
	{ 'christoomey/vim-tmux-navigator' },
	--
}

return plugins


