require("luasnip-latex-snippets").setup()

-- vim.treesitter.require_language("latex", "/path/to/python.so")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/ft" })
