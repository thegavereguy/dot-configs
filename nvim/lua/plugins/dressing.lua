return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			-- Disable image on nvim >= 0.12 if the treesitter runtime
			-- still references the removed set_timeout method.
			-- Remove this check once snacks.nvim is updated or
			-- you're on a stable 0.12.0+ build.
			image = { enabled = vim.fn.has("nvim-0.12") == 0 },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
}
