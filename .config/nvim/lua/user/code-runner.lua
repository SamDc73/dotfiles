local code_runner_status_ok, code_runner = pcall(require, "code_runner")
if not code_runner_status_ok then
  return
end

code_runner.setup({
	term = {
		position = "belowright",
		size = 8,
		mode = "startinsert"
	},
  filetype = {
    python = "python -u",
  },
})
