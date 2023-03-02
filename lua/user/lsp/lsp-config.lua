require("user.lsp.handlers").setup()

local servers = SERVERS

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("lspconfig not found")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local requre_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if requre_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	if server == "clangd" then
		opts.capabilities.offsetEncoding = 'utf-8'
	end
	lspconfig[server].setup(opts)
end
