local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

--   פּ ﯟ   some other good icons

local kind_icons = {
	Text = "󰊄",
	Method = "m",
	Function = "ƒ",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}


-- COMPLETIONS
return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",

		config = function()
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end

			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
				print("luasnip not found")
				return
			end

			require("luasnip/loaders/from_vscode").lazy_load()
			require("luasnip/loaders/from_lua").load({ paths = "~/.config/nvim/lua/user/snippets" })


			luasnip.config.setup({
				update_events = 'TextChanged,TextChangedI',
				region_check_events = "CursorHold,InsertLeave,InsertEnter, CursorMovedI",
				delete_check_events = "TextChanged,InsertEnter",
				enable_autosnippets = true,
			})
			local options = {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-e>"] = cmp.mapping {
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					},
					-- Accept currently selected item. If none selected, `select` first item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm { select = true },
					["jj"] = cmp.mapping.confirm { select = true },
					["kk"] = cmp.mapping {
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					},
					["<tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							fallback()
						else
							fallback()
						end
					end, {
						"i", "s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
						-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lsp_signature_help = "[Signature]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = 'nvim_lsp_signature_help' },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				window = {
					completion = {
						border = 'rounded',
						scrollbar = '║',
					},
					documentation = cmp.config.window.bordered(),
				},
			}

			cmp.setup(options)
		end,
		dependencies = {
			"cmp-nvim-lsp",
			"cmp-buffer",
			"cmp-path",
			"cmp_luasnip",
			"cmp-nvim-lsp-signature-help",
		},
	},
	{ "hrsh7th/cmp-buffer",                  lazy = true },
	{ "hrsh7th/cmp-path",                    lazy = true },
	{ "hrsh7th/cmp-nvim-lsp",                lazy = true },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
	{ "saadparwaiz1/cmp_luasnip",            lazy = true },
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" }
	},
	{ "rafamadriz/friendly-snippets" },
}