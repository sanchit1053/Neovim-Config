return {
	{
		"rmagatti/alternate-toggler",
		cmd = "ToggleAlternate",
	},
	{
		"tpope/vim-surround"
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
}

