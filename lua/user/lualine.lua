local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("lualine not found")
	return
end

local function server_name()
	local active_servers = vim.lsp.buf_get_clients()
	local count = 0
	local firstClient = ""
	for i, client in pairs(active_servers) do
		count = count + 1
		if count == 1 then
			firstClient = client.name
		end
	end
	if count == 0 then
		return ""
	end
	local ret = firstClient
	if count > 1 then
		ret = ret .. "+"
	end
	return ret
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype', server_name },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
