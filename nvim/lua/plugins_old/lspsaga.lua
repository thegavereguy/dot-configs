local keymap = vim.keymap.set

require("lspsaga").setup{
	ui = {
		theme = "round",
		title = true,
		border = "rounded",
		winblend = 0
	},
	lightbulb = {
		enable = false,
	}
}

--keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
--keymap({"n","v"}, "ca", "<cmd>Lspsaga code_action<CR>")
--keymap("n", "rn", "<cmd>Lspsaga rename<CR>")
--keymap("n", "rn", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
--keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
--keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
--keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
--keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
--keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
--keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
--keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toggle outline
--keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
--keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
