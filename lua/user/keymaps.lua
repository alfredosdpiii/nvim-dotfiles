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

-- Normal --
-- Better window navigation
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

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

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

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--Select All
keymap("n", "<C-a>", "gg<S-v>G", opts)

--refresh conf
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua", opts)

--telescope stuff
keymap("n", "<leader>cs", ":lua require'telescope.builtin'.colorscheme{}<CR>", opts)
--find buffer
keymap("n", ";", ":lua require'telescope.builtin'.buffers{}<CR>", opts)
--find in current buffer
keymap("n", "<leader>/", ":lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>", opts)
--git files
keymap("n", "<leader>op", ":lua require'telescope.builtin'.git_files{}<CR>", opts)
--rip grep through dir
keymap("n", "<leader>rg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)

--fugitive
keymap("n", "<leader>gs", ":G<CR>", opts)
--tree toggle
keymap("n", "<C-t>", "<cmd>NvimTreeToggle<cr>", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>d", "_d", opts)
keymap("n", "<leader>d", "_d", opts)
keymap("n", "<leader>x", "_x", opts)
keymap("n", "Y", "y$", opts)

--harpoon stuff
keymap("n", "<leader>A", ':lua require("harpoon.ui").add_file()<CR>', opts)
keymap("n", "<C-e>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

--undotree
keymap("n", "<F5>", ":UndoTreeToggle<CR>", opts)

-- keymap("n", "t<leader>", ":tabNext<CR>", opts)
