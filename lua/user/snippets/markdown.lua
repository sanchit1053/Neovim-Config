local function hasVal(table, val)
	for index, value in ipairs(table) do
		if value == val then
			return true
		end
	end
	return false
end

local function checkspace(args, parent, user_args)
	local c = string.sub(args[1][1], 1, 1)
	local allowed = { ',', '.', '?', '-', '_' }
	if args[1][1] and not hasVal(allowed, c) then
		return ' '
	else
		return ''
	end
end

local function createBox(args, parent, user_args)
	local pos = user_args
	if pos == 'top' then
		return '┌' .. string.rep('-', string.len(args[1][1])) .. '┐'
	elseif pos == 'bottom' then
		return '└' .. string.rep('-', string.len(args[1][1])) .. '┘'
	end
end

return {

	s({
			trig = "mk",
			dscr = "Inline Math",
			snippetType = "autosnippet",
		},
		{
			t("$"),
			i(1),
			t("$"),
		}
	),

	s({
			trig = 'box',
			dscr = 'Box',
			snippetType = "autosnippet",
		},
		{
			f(createBox, { 1 }, { user_args = { "top" } }),
			t({ "", "|" }),
			i(1),
			t({ "|", "" }),
			f(createBox, { 1 }, { user_args = { "bottom" } }),
			t({ "", "" })

		})
}
