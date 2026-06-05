local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local autocommand = vim.api.nvim_create_autocmd

vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

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
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)

-- Lazygit
keymap("n", "<leader>G", ":LazyGit<CR>", opts)

-- Navigate tags
keymap("n", "tt", ":tabnew ", { noremap = true })
keymap("n", "tn", ":tabnext<CR>", opts)
keymap("n", "tp", ":tabprevious<CR>", opts)
keymap("n", "tc", ":tabclose<CR>", opts)

-- NerdTREE
-- keymap("n", "<C-N>", ":NERDTreeToggleVCS<CR>", opts)

-- NvimTree
keymap("n", "<C-N>", ":NvimTreeToggle<CR>", opts)

-- LspSaga
keymap("n", "rn", ":Lspsaga rename<CR>", opts)
keymap("n", "gi", ":Lspsaga finder<CR>", opts)
keymap("n", "ca", ":Lspsaga code_action<CR>", opts)
keymap("n", "gd", ":Lspsaga peek_definition<CR>", opts)
keymap("n", "gD", ":Lspsaga peek_type_definition<CR>", opts)
keymap("n", "<leader>gd", ":Lspsaga goto_definition<CR>", opts)
keymap("n", "<leader>gD", ":Lspsaga goto_type_definition<CR>", opts)
keymap("n", "<leader>sb", ":Lspsaga show_buf_diagnostics<CR>", opts)
keymap("n", "<leader>sw", ":Lspsaga show_workspace_diagnostics<CR>", opts)
keymap("n", "<leader>k", ":Lspsaga hover_doc<CR>", opts)
keymap("n", "<leader>o", ":Lspsaga outline<CR>", opts)

-- Floaterm
-- keymap("n", "<leader>d", ":lua require('floaterm').toggle()<CR>", opts)
-- keymap("t", "<leader>d", ":lua require('floaterm').toggle()<CR>", opts)

-- CMakeTools
keymap("n", "<leader>cmr", ":CMakeRun<CR>", opts)
keymap("n", "<leader>cmb", ":CMakeBuild<CR>", opts)
keymap("n", "<leader>cmt", ":CMakeRunTest<CR>", opts)
