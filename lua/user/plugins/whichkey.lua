-- local status_ok, whichkey = pcall(require, "which-key")
-- if not status_ok then
-- 	print("whichkey not found")
-- 	return
-- end

-- local opts = {
-- 	mode = "n", -- Normal mode
-- 	prefix = "<leader>",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = false, -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
-- 	s =  "Save" ,
-- 	q =  "Quit" ,
-- 	Q =  "Force Quit",
-- 	z = {
-- 		name = "Packer",
-- 		c = { "<cmd>PackerCompile<cr>", "Compile" },
-- 		i = { "<cmd>PackerInstall<cr>", "Install" },
-- 		s = { "<cmd>PackerSync<cr>", "Sync" },
-- 		S = { "<cmd>PackerStatus<cr>", "Status" },
-- 		u = { "<cmd>PackerUpdate<cr>", "Update" },
-- 	},
-- }

-- whichkey.register(mappings, opts)
-- whichkey.setup(conf)

-- WhichKey
return {
	"folke/which-key.nvim",
	opts = {},
}
