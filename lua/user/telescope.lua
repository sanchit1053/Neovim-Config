local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	print("[ERROR] Telescope not found")
end

telescope.load_extension('lsp_handlers')

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	}
})
