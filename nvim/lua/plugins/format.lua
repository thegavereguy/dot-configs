return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				cpp = { "clang-format" },
				c = { "clang-format" },
				cmake = { "gersemi" },
			},
		},
	},
}
