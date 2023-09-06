local Options = vim.opt

Options.tabstop = 2
Options.shiftwidth = 2

local opts = { noremap = true, silent = true }


-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "XX", ":FloatermNew --autoclose=0 cargo run <CR>",opts)
keymap("n", "<F7>", ":lua require('dapui').toggle()<CR>", opts)
-- keymap("n", "<F8>", ":lua require('dapui').close()<CR>", opts)

keymap("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<F6>", ":lua require('dap').continue()<CR>", opts)
keymap("n", "<F11>", ":lua require('dap').step_over()<CR>", opts)
keymap("n", "<F10>", ":lua require('dap').step_into()<CR>", opts)

