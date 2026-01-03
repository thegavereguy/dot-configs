return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({ automatic_enable = true })
		end,
	},
	{ "neovim/nvim-lspconfig", opt = {} },
	{
		"glepnir/lspsaga.nvim",

		config = function()
			require("lspsaga").setup({
				ui = {
					theme = "round",
					title = true,
					border = "rounded",
					winblend = 0,
				},
				lightbulb = { enable = false },
			})
		end,
	},
	{ "folke/trouble.nvim", opts = {} },
	{
		"nvim-treesitter/nvim-treesitter",

		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ignore_install = {},
				sync_install = false,
				modules = {},
				ensure_installed = {
					"lua",
					"vim",
					"go",
					"toml",
					"css",
					"tsx",
					"css",
					"html",
					"lua",
					"norg",
				},
				highlight = {
					enable = true,
					use_languagetree = true,
					additional_vim_regex_highlighting = false,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},

				autotag = {
					enable = true,
					filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"svelte",
						"vue",
						"tsx",
						"jsx",
						"rescript",
						"css",
						"lua",
						"xml",
						"php",
						"markdown",
					},
				},
				indent = { enable = true },
			})
		end,
	},
}
