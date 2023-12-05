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

local relate_number_group = api.nvim_create_augroup("relativenumber", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
	group = relate_number_group,
	callback = function(_)
		vim.opt.relativenumber = false;
	end,
})

api.nvim_create_autocmd("InsertLeave", {
	group = relate_number_group,
	callback = function(_)
		vim.opt.relativenumber = true;
	end
})

--
-- api.nvim_create_autocmd("BufWritePost", {
-- 	group = api.nvim_create_augroup("AutoRun", { clear = true }),
-- 	pattern = "*.cpp",
-- 	callback = function(ev)
-- 		local fileWithoutExt = string.match(ev.file, "(.+)%..+$");
-- 		local buf = vim.api.nvim_create_buf(false, true);
-- 		vim.api.nvim_command(":vs")
-- 		vim.api.nvim_set_current_buf(buf);
-- 		print({"g++", "-o" , fileWithoutExt, ev.file, "&&", "./" .. fileWithoutExt});
-- 		vim.fn.jobstart({"g++", "-o" , fileWithoutExt, ev.file, "&&", "./" .. fileWithoutExt}, {
-- 			stdout_buffered = true,
-- 			on_stdout = function(_, data)
-- 				if data then
-- 					vim.api.nvim_buf_set_lines(buf, -1, -1, false, data);
-- 				end
-- 			end,
-- 			on_stderr = function(_, data)
-- 				if data then
-- 					vim.api.nvim_buf_set_lines(buf, -1, -1, false, data);
-- 				end
-- 			end,
-- 		})
-- 	end
-- })
