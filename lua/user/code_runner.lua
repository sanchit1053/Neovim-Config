local status_ok, codeRunner = pcall(require, 'code_runner')
if not status_ok then
	print("Code Runner not found")
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
