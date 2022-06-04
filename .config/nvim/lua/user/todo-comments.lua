local todo_status_ok, todo = pcall(require, "todo-comments")
if not todo_status_ok then
  return
end

todo.setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		BUG = {
			icon = " ", -- icon used for the sign, and in search results
			color = "#DC2626", -- can be a hex color, or a named color (see below)
			alt = { "bug", "Bug", "!" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individuall
		},
		TODO = { icon = " ", color = "#2563EB" },
		HACK = { icon = " ", color = "#FBBF24" },
		WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING", "XXX" } },
		NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
		codeExplanation = { icon = " ", color = "#cc34c9", alt = { "How" } },
		Header = { color = "#2cff3e", alt = { "#" } },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "bg", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "bg", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})
