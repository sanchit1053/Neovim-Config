local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("treesitter not found")
	return
end


configs.setup {
	ensure_installed = { "cpp", "lua", "python", "vim"},
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = {enable = true, disable = { "" } },

	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},

	playground = {
		enable = true,
	},
}

