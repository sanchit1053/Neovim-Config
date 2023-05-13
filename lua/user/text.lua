local status_ok, autoclose = pcall(require, 'autoclose')
if not status_ok then
	print("autoclose not found")
	return
end
autoclose.setup({
	disable_filetype = { 'TelescopePrompt', 'vim' }
})
