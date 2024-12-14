return
{
	"echasnovski/mini.pairs",
	event = "InsertEnter",
	config = function()
		NVIMCONFIG.setKeyMaps {
			{
				"n", "<leader>Tp",
				function()
					vim.g.minipairs_disable = not vim.g.minipairs_disable;
				end,
				{ desc = "toggle [p]airs" }
			}
		}
		require("mini.pairs").setup()
	end
}
