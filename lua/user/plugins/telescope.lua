return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = { "Telescope" },
		config = function()
			local status_ok, telescope = pcall(require, 'telescope')
			if not status_ok then
				print("Telescope not found")
			end

			telescope.load_extension('lsp_handlers')

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = "which_key"
						}
					}
				},

				extensions = {
					lsp_handlers = {
						code_action = {
							telescope = require('telescope.themes').get_dropdown({}),
						},
					},
				},
			})
		end
	},
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		dependencies = { 'nvim-telescope/telescope.nvim' }
	},
}
