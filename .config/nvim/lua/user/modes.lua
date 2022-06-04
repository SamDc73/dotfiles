require("modes").setup({
	colors = {
		-- copy = "#f5c359",
		-- delete = "#c75c6a",
		-- insert = "#78ccc5",
		-- visual = "#9745be",
	  copy = "#fd971f",
		delete = "#e95678",
		insert = "#a6e22e",
		visual = "#9745be",
  },

	-- Cursorline highlight opacity
	line_opacity = 0.1,

	-- Highlight cursor
	set_cursor = true,

	-- Highlight in active window only
	focus_only = false,
})

-- Exposed highlight groups, useful for themes
vim.cmd("hi ModesCopy guibg=#fd971f")
vim.cmd("hi ModesDelete guibg=#e95678")
vim.cmd("hi ModesInsert guibg=#a6e22e")
vim.cmd("hi ModesVisual guibg=#9745be")
