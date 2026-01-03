local Options = vim.opt
local global = vim.g -- global variables

Options.number = true
Options.modifiable = true
Options.encoding = "utf-8"
Options.hidden = true
Options.cursorline = false
Options.tabstop = 2
Options.shiftwidth = 2
Options.cmdheight = 1
Options.updatetime = 300
Options.completeopt = { "menuone", "preview", "noinsert", "noselect" }
Options.showmode = false -- nascone la modalita dalla barra
Options.termguicolors = true
Options.pumheight = 15
Options.smartindent = true
Options.smartcase = true
Options.undofile = true
Options.cursorline = true
Options.signcolumn = "yes"
Options.wrap = false
Options.scrolloff = 10 -- numero minimo di righe sotto/sopra al documento visualizzato prima di scrollare
Options.sidescrolloff = 10 -- stessa roba ma orizzontale
Options.foldcolumn = "auto" -- imposta la colonna per visualizzare le ripiegature

Options.foldmethod = "expr"
Options.foldexpr = "nvim_treesitter#foldexpr()"
Options.foldenable = false

global.mapleader = " "
global.maplocalleader = "\\"

if global.neovide then
	global.neovide_scale_factor = 0.8
end

-- Formatters options
-- Rust
global.formatdef_rustfmt = '"rustfmt"'
global.formatters_rust = { "rustfmt" }
global.rust_raccomended_style = 0

-- floaterm
global.floaterm_borderchars = "─│─│╭╮╯╰"
global.floaterm_keymap_kill = "Q"
global.floaterm_keymap_toggle = "<leader>d"

-- autocommands
local api = vim.api
local M = {}

function M.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command("augroup " .. group_name)
		api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			api.nvim_command(command)
		end
		api.nvim_command("augroup END")
	end
end

local autoCommands = {
	-- other autocommands
	open_folds = { { "BufReadPost,FileReadPost", "*", "normal zR" } },
}

M.nvim_create_augroups(autoCommands)

-- Da problemi con cmaketools, notifica persistente dopo esecuzione
-- vim.notify = require("notify")

-- lsp diagnostics
-- vim.diagnostic.config({virtual_lines = {only_current_line = true}})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
