return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "texlab" },
				-- `cmake-language-server` (lspconfig name "cmake") is broken with the
				-- pygls 1.x that Mason installs (ImportError: cannot import name
				-- 'LanguageServer'), so neocmakelsp handles CMake instead.
				automatic_enable = { exclude = { "cmake" } },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opt = {},
		config = function()
			vim.lsp.config("tblgen-lsp", {
				-- The command to launch the server
				cmd = { "tblgen-lsp-server" },

				-- Root directory detection: looks for a compilation database or git repo
				root_markers = { "build/tablegen_compile_commands.yml", ".git" },

				filetypes = { "tablegen", "td" },
				-- Optional: pass include paths if the LSP can't find your .td files
				settings = {
					tablegen = {
						compilationDatabase = "build/tablegen_compile_commands.yml",
						includeDirs = { "/usr/include", "./include" },
					},
				},
			})
			-- CMake: neocmakelsp (installed via `:MasonInstall neocmakelsp`).
			-- Enabled by mason-lspconfig; tuned in .neocmake.toml per project.
			vim.lsp.config("neocmake", {
				root_markers = { ".neocmake.toml", "CMakePresets.json", ".git", "build", "cmake" },
				init_options = {
					format = { enable = true },
					lint = { enable = true },
				},
			})
		end,
	},
	{
		"ray-x/navigator.lua",
		dependencies = { "ray-x/guihua.lua" },
		config = function()
			require("navigator").setup({
				-- nvim-lspconfig and mason own the LSP servers; navigator only
				-- adds the navigation UI on top of the clients they start.
				lsp = {
					enable = true,
					disable_lsp = "all",
					-- conform.nvim already formats on BufWritePre.
					format_on_save = false,
				},
				-- blink.cmp provides signature help while inserting.
				lsp_signature_help = false,
				-- Keymaps are declared in lua/keymaps.lua. navigator's defaults
				-- would clash with existing maps (<C-k>, <Space>, ...).
				default_mapping = false,
				border = "rounded",
				transparency = 100, -- 100 disables the mask (opaque floats)
				-- Strip the emoji navigator hardcodes into its UI. `icons = false`
				-- only clears the diagnostic list heads and sign glyphs; the rest
				-- are read unconditionally, so they must be blanked explicitly.
				icons = {
					icons = false,
					code_action_icon = "",
					code_lens_action_icon = "",
					diagnostic_head = "",
					diagnostic_err = "",
					diagnostic_warn = "",
					diagnostic_info = "",
					diagnostic_hint = "",
					diagnostic_head_severity_1 = "",
					diagnostic_head_severity_2 = "",
					diagnostic_head_severity_3 = "",
					diagnostic_head_description = "",
					diagnostic_virtual_text = "",
					diagnostic_file = "",
					value_definition = "",
					value_changed = "",
					treesitter_defult = "",
					fold = { prefix = "", separator = "" },
					-- Only the emoji entries; the nerd font glyphs stay as they are.
					match_kinds = {
						associated = "",
						namespace = "",
						field = "",
						module = "",
						flag = "",
					},
				},
			})
		end,
	},
	{ "folke/trouble.nvim", opts = {} },
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup({
				auto_install = true,
			})
		end,
	},
}
