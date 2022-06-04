local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])  -- Only required if you have packer configured as `opt`
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins (code_runner, telescope )
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons") -- Icons, required by (nvim-tree, )
	use("kyazdani42/nvim-tree.lua") -- A file explorer tree
	use {'akinsho/bufferline.nvim', tag = "*" }  -- Tabs in nvim
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })  -- Treesitter
  -- use("moll/vim-bbye") -- Delete buffers and close files in Vim without closing your windows
	use("nvim-lualine/lualine.nvim") --nvim stausline
	use("akinsho/toggleterm.nvim") -- open Terminal Inside NeoVim
	-- use("ahmedkhalf/project.nvim")  -- Projectes manager
	use("lewis6991/impatient.nvim") --SpeedUp loadTime
	use("lukas-reineke/indent-blankline.nvim") -- Indent guides
	use("goolord/alpha-nvim") -- Customized Dashboard
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("lewis6991/gitsigns.nvim") -- git integration
	use{"tanvirtin/monokai.nvim"} --Coloescheme
	-- use{"cpea2506/one_monokai.nvim"}  -- Alt colorscheme
  use("folke/todo-comments.nvim") -- Fancy comments
	use("Pocco81/AutoSave.nvim") -- automatically saving your work
	use{"CRAG666/code_runner.nvim"} -- Run Code without leaving nvim
	use("mvllow/modes.nvim") -- colrize each mode in nvim
  use("norcalli/nvim-colorizer.lua") -- ADD colors to css
	use("rmagatti/auto-session") -- Seassion manager
	use("rmagatti/session-lens") -- Extends auto-session through Telescope.nvim
	use("nathom/filetype.nvim") -- A faster version of filetype.vim
	use("lambdalisue/suda.vim")  -- read or write files with sudo command.
  use("max397574/better-escape.nvim")  -- Escape from insert mode without delay when typing
  use{'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  -- use("dhruvasagar/vim-table-mode")  -- instant table creation.
	-- use({ "ellisonleao/glow.nvim", branch = "main" }) -- A markdown preview using glow
  -- use {'filipdutescu/renamer.nvim', branch = 'master'}  -- VS Code-like renaming UI

  -- user Specific
  -- use("mbledkowski/neuleetcode.vim")  -- solve leetcode problems
  -- use("8ooo8/vim-leetcode")
  -- use({ "ahmedkhalf/jupyter-nvim", run = ":UpdateRemotePlugins" }) -- Read Jupyter Notes inside Nvim
	-- use("dccsillag/magma-nvim")  -- Interactive jupyter Notes

  -- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	-- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}} -- View diagnostic errors, see relationships of functions, variables
	-- use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use{"sudormrfbin/cheatsheet.nvim"}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
