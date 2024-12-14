return {
	-- settings = {
	-- 	java = {
	-- 		configuration = {
	-- 			runtimes = {
	-- 				{
	-- 					name = "JavaSE-17",
	-- 					path = "/usr/lib/jvm/openjdk-17/",
	-- 					default = true,
	-- 				}
	-- 			}
	-- 		}
	-- 	}
	-- },
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
	end,
	on_init = function(client)
		client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
	end
}
