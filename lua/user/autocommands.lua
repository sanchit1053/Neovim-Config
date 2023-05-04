local api = vim.api

-- Yank text Highlight
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700})",
	group = yankGrp
})


-- Start at the same position
api.nvim_create_autocmd("BufReadPost", {
	command = [[if line ("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
})
