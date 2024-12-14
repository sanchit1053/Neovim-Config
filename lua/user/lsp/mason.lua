local servers = {
	"ruff",
	"lua_ls",
	"clangd",
	"jdtls",
}

SERVERS = servers

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("lspconfig not found")
	return
end

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
	handlers = {
		function(server)
			local opts = {
				on_attach = require("user.lsp.handlers").on_attach,
				capabilities = require("user.lsp.handlers").capabilities,
			}

			local requre_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
			if requre_ok then
				opts = vim.tbl_deep_extend("force", conf_opts, opts)
			end

			if server == "clangd" then
				opts.capabilities.offsetEncoding = 'utf-8'
			end
			lspconfig[server].setup(opts)
		end,
	}
})

lspconfig.gleam.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers")
		.capabilities,
})
