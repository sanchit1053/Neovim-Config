local status_ok, indent_scope = pcall(require, 'mini.indentscope')
if not status_ok then
	print("Indent Scope Not Found")
	return;
end

indent_scope.setup({
	symbol = '|'
})
