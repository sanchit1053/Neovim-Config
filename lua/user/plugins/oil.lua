return
{
	"stevearc/oil.nvim",
	--@module 'oil'
	--@type oil.SetupOpts
	opts = {
		watch_for_changes = true,
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require("oil").setup();
	end
}
