local function server_name()
	local active_servers = vim.lsp.get_clients()
	local count = 0
	local firstClient = ""
	for _, client in pairs(active_servers) do
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

local function compitest_status()
	return vim.b.competitest_title or "CompetiTest"
end

local compitest = {
	sections = {
		lualine_a = { compitest_status }
	},
	filetypes = { "CompetiTest" }
}

local competitest_line = {
	filetypes = { 'CompetiTest' },
	inactive_sections = {
		lualine_b = { function()
			return vim.b.competitest_title or 'CompetiTest'
		end },
	},
}

local options = {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = { 'CompetiTest' },
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
		lualine_b = { 'branch', 'diff', {
			'diagnostics',
			symbols = {
				error = " ",
				warn  = " ",
				hint  = " ",
				info  = " ",
			}
		} },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' --[[ , server_name  ]] },
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
	extensions = { competitest_line }
}

return
{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
	opts = options,
}
