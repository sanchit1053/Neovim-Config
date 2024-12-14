return
{
	{
		'gen740/SmoothCursor.nvim',
		config = function()
			require('smoothcursor').setup()
		end,
		enabled = false,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
		tag = "legacy",
	},
	{ 'stevearc/dressing.nvim', lazy = true },
	{
		'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup()
		end
	}
}
