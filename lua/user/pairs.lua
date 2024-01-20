local status_ok, mini_pairs = pcall(require, "mini.pairs")
if not status_ok then
	print("mini.pairs not found")
	return
end

mini_pairs.setup()

NVIMCONFIG.setKeyMaps {
	{
		"n", "<leader>Tp",
		function()
			vim.g.minipairs_disable = not vim.g.minipairs_disable;
		end,
		{ desc = "toggle [p]airs" }
	}
}
