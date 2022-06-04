local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end


lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = false,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_d = { require("auto-session-library").current_session_name }, -- For auto-session
		lualine_e = {require('auto-session-library').current_session_name},
    lualine_x = {
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					--    
          dos = "", -- e70f
					mac = "", -- e711
				},
			},
		},
		lualine_y = { "filetype" }, -- 'location' for adding cursor location
		lualine_z = { "progress" }, -- 'location' for adding cursor location
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "quickfix", "toggleterm", "nvim-tree", "symbols-outline" },
})
