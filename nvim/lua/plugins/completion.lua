return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"fang2hou/blink-copilot",
	},

	version = "1.*",
	opts = {

		-- Disable cmdline
		cmdline = { enabled = false },

		completion = {
			keyword = { range = "full" },

			accept = { auto_brackets = { enabled = false } },

			-- Don't select by default, auto insert on selection
			list = { selection = { preselect = false, auto_insert = true } },

			menu = {
				auto_show = true,

				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
				},
			},

			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500 },

			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
		},
		keymap = {
			["<space-Tab>"] = { "show" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<S-k>"] = { "scroll_documentation_up", "fallback" },
			["<S-j>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<Enter>"] = { "accept", "fallback" },
		},

		sources = {
			default = { "copilot", "lsp", "path", "snippets" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		snippets = { preset = "luasnip" },

		-- Experimental signature help support
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
