return {
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		config = function()
			vim.cmd [[
 				autocmd BufEnter *.{md,mkd,mdown,mkdn,mdwn} call mkdp#util#open_preview_page()

 				function OpenMarkdownPreview (url)
 					execute "silent ! /mnt/c/Program\\ Files/Google/Chrome/Application/chrome.exe " . a:url
 				endfunction
 				let g:mkdp_browserfunc = 'OpenMarkdownPreview'
 			]]
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_combine_preview = 1
			vim.g.mkdp_filetype = { "markdown" }
		end,
	},

	{
		'dkarter/bullets.vim',
		ft = { "markdown" },
	},
}
