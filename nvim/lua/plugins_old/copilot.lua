require("copilot_cmp").setup()
require("copilot").setup({
    suggestion = {enabled = true},
    panel = {enabled = false}
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg = "#6CC644"})

