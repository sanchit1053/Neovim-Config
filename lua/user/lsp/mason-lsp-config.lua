local servers = SERVERS

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

