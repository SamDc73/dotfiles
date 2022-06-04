local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",



-- Normal -- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":Bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Insert --
-- Press jk fast to enter
-- keymap("v", "jj", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)



-- Basic navigation
keymap("i", "<C-a>", "<ESC>I", opts)
keymap("i", "<C-e>", "<ESC>A", opts)
keymap("i", "<C-BS>", "<ESC>dvbi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Change Default Change Default Change Default Change Default Change Default Change Default Change Default Change Default Change Default Values --
-- Make d for delete without copying to the buffer
vim.api.nvim_set_keymap('v', 'd', '"_d', {noremap=true})
vim.api.nvim_set_keymap('n', 'dd', '"_dd', {noremap=true})
vim.api.nvim_set_keymap('n', 'X', 'dd', {noremap=true})

-- Change Shift+k to Shift+m
vim.api.nvim_set_keymap('n', '<S-m>', '<S-k>', {noremap=true})
-- keymap("n", "<S-m>", "S-k", opts)

--External Apps specific
-- Telescope
keymap("n", "<C-s>", ":Telescope session-lens search_session", opts)  -- open session-lens
keymap("n", "<C-t>", ":Telescope find_files", opts)

-- toggleTerm
-- keymap("n", "<c-x>", ":ToggleTerm dir='%:p:h'<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("c", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- Python
-- keymap("n", "<C-z>", ":!python %", opts)

-- Bufferline
keymap("n", "<S-k>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<S-j>", ":BufferLineCyclePrev<cr>", opts)

-- RunCode
keymap("n", "<C-c>", ":RunCode<cr>", opts)


-- <C-x> Run Terminal
-- <jj> <jk> to exit insert_mode
-- <C-q> Visual blocke mode




