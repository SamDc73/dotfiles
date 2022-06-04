local session_status_ok, session = pcall(require, "auto-session")
if not session_status_ok then
  return
end

session.setup({
	log_level = "info",
	auto_session_suppress_dirs = {"/mnt/hdd/myProjects/", "~/"},
	auto_session_enable_last_session = true,
	auto_restore_enabled = true,
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- session-lens config
require("telescope").load_extension("session-lens")
require('session-lens').setup {
  prompt_title = 'SESSIONS',
  -- path_display = {'shorten'},
  theme_conf = { border = false },
  -- previewer = true,
}
