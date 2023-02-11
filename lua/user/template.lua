local status_ok, template = pcall(require, "template")
if not status_ok then
	print("template nvim not found")
	return
end

template.temp_dir = "~/.config/nvim/lua/user/templates/"


