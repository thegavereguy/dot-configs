return {
	-- {
	-- 	"voldikss/vim-floaterm",
	-- 	-- keys = {"<leader>", "t", ":FloatermToggle<CR>", desc = {"floaterm"}}
	-- },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 15,
			open_mapping = [[<leader>d]], -- This binds the toggle action
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 0,
			start_in_insert = true,
			insert_mappings = false,
			persist_size = true,
			direction = "horizontal", -- Can be 'vertical', 'horizontal', or 'float'
			close_on_exit = true,
			shell = vim.o.shell,
		},
	},
	--{ "nvzone/floaterm", dependencies = "nvzone/volt", opts = {}, cmd = "FloatermToggle" },
}
