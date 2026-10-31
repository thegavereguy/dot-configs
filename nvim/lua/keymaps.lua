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

-- NvimTree
keymap("n", "<C-N>", ":NvimTreeToggle<CR>", opts)

-- Navigator (LSP UI)
-- Mappings live here rather than in navigator's defaults, which would clash
-- with existing maps such as <C-k> and the <Space> no-op.
local nav = function(module, method, arg)
	return function()
		local mod = require("navigator." .. module)
		if arg ~= nil then
			mod[method](arg)
		else
			mod[method]()
		end
	end
end

vim.keymap.set("n", "rn", nav("rename", "rename"), { silent = true, desc = "Rename symbol" })
vim.keymap.set("n", "gi", nav("reference", "async_ref"), { silent = true, desc = "Finder (definitions + references)" })
-- Not navigator.codeAction: it sends vim.Diagnostic objects as the LSP
-- CodeActionContext, which servers reject (nvim 0.12 expects the raw LSP
-- diagnostics in `user_data.lsp`). Neovim builds a correct context itself.
vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, { silent = true, desc = "Code action" })
vim.keymap.set("n", "gd", nav("definition", "definition_preview", 1000), { silent = true, desc = "Peek definition" })
vim.keymap.set(
	"n",
	"gD",
	nav("definition", "type_definition_preview", 1000),
	{ silent = true, desc = "Peek type definition" }
)
vim.keymap.set("n", "<leader>gd", nav("definition", "definition"), { silent = true, desc = "Goto definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.type_definition, { silent = true, desc = "Goto type definition" })
vim.keymap.set(
	"n",
	"<leader>sb",
	nav("diagnostics", "show_buf_diagnostics"),
	{ silent = true, desc = "Buffer diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>sw",
	nav("diagnostics", "show_diagnostics"),
	{ silent = true, desc = "Workspace diagnostics" }
)
vim.keymap.set("n", "K", nav("hover", "hover"), { silent = true, desc = "Hover documentation" })
vim.keymap.set("n", "<leader>o", nav("symbols", "side_panel"), { silent = true, desc = "Outline (LSP symbols)" })

-- Floaterm
-- keymap("n", "<leader>d", ":lua require('floaterm').toggle()<CR>", opts)
-- keymap("t", "<leader>d", ":lua require('floaterm').toggle()<CR>", opts)

-- CMakeTools
keymap("n", "<leader>cmr", ":CMakeRun<CR>", opts)
keymap("n", "<leader>cmb", ":CMakeBuild<CR>", opts)
keymap("n", "<leader>cmt", ":CMakeRunTest<CR>", opts)
