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

local function createBox(args, _, user_args)
	local pos = user_args
	if pos == 'top' then
		return '┌' .. string.rep('─', string.len(args[1][1])) .. '┐'
	elseif pos == 'bottom' then
		return '└' .. string.rep('─', string.len(args[1][1])) .. '┘'
	end
end

return {

	s({
			trig = "mk",
			dscr = "Inline Math",
		},
		{
			t("$"),
			i(1),
			t("$"),
		}
	),

	s({
			trig = "dot",
			dscr = "start dot graph environment",

		},
		{
			t({ "```dot", "digraph G{", "\tgraph[rankdir = \"LR\"; ordering=\"in\"]", "\t" }),
			i(0),
			t({ "", "}", "```" }),
		}),
	s({
			trig = "mermaid",
			dscr = "start mermaid graph environment",

		},
		{
			t({ "```mermaid", "graph LR", "\t" }),
			i(0),
			t({ "", "```" }),
		}),

	s({
			trig = 'box',
			dscr = 'Box',
		},
		{
			f(createBox, { 1 }, { user_args = { "top" } }),
			t({ "", "│" }),
			i(1),
			t({ "│", "" }),
			f(createBox, { 1 }, { user_args = { "bottom" } }),
			t({ "", "" })

		}),
	s({
			trig = "startlecture",
			dscr = "lecture heading"
		},
		{
			t("# Lecture "),
			i(1),
			t(" <div style=\"text-align:right\"> "),
			extras.partial(os.date, "%d/%m/%Y"),
			t(" </div>", ""),
		}),
	s(
		{ trig = "equation", desc = "equation block" },
		fmt([[
		

		$$
		\begin{{align*}}
			{}
		\end{{align*}}
		$$


		]], {i(1, "equation")})),

}
