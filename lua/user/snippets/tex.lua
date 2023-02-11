snippets = {
	s({
		trig = 'template',
		desc = 'basic template',
	},
		{
			t({ "\\documentclass[a4paper]{article}",
				"",
				"\\usepackage[utf8]{inputenc}",
				"\\usepackage[T1]{fontenc}",
				"\\usepackage{textcomp}",
				"\\usepackage{amsmath, amssymb}",
				"\\pdfsuppresswarningpagegroup=1",
				"\\begin{document}",
				"" }),
			i(0),
			t({ "", "\\end{document}" }),
		}),

	s({
		trig = "beg",
		desc = "environment",
	}, {
		t({ "\\begin{" }), i(1),
		t({ "}", "" }),
		i(0),
		t({ "\\end{" }),
		extras.rep(1),
		t({ "}", "" }),
	})
}

return snippets
