local function setupColor(colorScheme)
	local color_status_ok, _ = pcall(require, colorScheme)
	if not color_status_ok then
		print("colorscheme not found")
		return
	end

	local status_ok, errorMsg = pcall(vim.cmd.colorscheme, colorScheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorScheme .. " not found")
		error(errorMsg)
		return
	end
end



-- Color Schemes
return {
	{ "folke/tokyonight.nvim",    enabled = false },
	{ "ellisonleao/gruvbox.nvim", enabled = false },
	{ "shaunsingh/nord.nvim",     enabled = false },
	{ "ramojus/mellifluous.nvim", enabled = false },
	{ "rebelot/kanagawa.nvim",    enabled = false },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		config = function()
			setupColor("nightfly");
		end
	},
}
