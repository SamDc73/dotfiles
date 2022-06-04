-- local status_ok, indent_blankline = pcall(require, "indent_blankline")
-- if not status_ok then
-- 	return
-- end
--
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "│"
-- vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_char = "▎"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#e95678 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#fd971f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#e6db74 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#a6e22e gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#66d9ef gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#ae81ff gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#f92672 gui=nocombine]])

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
})
