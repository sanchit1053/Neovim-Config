return
{
	"CRAG666/code_runner.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	ft = { "cpp" },
	config = function()
		local status_ok, codeRunner = pcall(require, 'code_runner')
		if not status_ok then
			if vim.bo.filetype == "cpp" then
				print("Code Runner not found")
			end
			return
		end

		local commands = {
			cpp = "cd '$dir' && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		}

		codeRunner.setup({
			focus = true,
			startinsert = true,
			term = {
				position = "vert",
				size = 40,
			},
			filetype = commands,
		})
	end
}
