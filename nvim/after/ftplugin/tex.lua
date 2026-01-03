require("cmp").setup.buffer({
	formatting = {
		format = function(entry, vim_item)
			print(entry.source.name)
			vim_item.menu = ({
				omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
				buffer = "[Buffer]",
				luasnip = "[LuaSnip]",
				nvim_lsp = "[LSP]",
				-- formatting for other sources
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "omni" },
		{ name = "buffer" },
		{ name = "luasnip" },
		-- { name = 'nvim_lsp', group_index= 1}
		-- other sources
	},
})
