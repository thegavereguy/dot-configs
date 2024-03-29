require("hover").setup {
	init = function()
		require("hover.providers.lsp")
		require('hover.providers.gh')
		require('hover.providers.gh_user')
		-- require('hover.providers.jira')
		require('hover.providers.man')
		-- require('hover.providers.dictionary')
	end,
	preview_opts = {
		border = "."
	},
	-- Whether the contents of a currently open hover window should be moved
	-- to a :h preview-window when pressing the hover keymap.
	preview_window = false,
	title = true
}
