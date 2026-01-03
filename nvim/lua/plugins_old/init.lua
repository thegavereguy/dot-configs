require("plugins.vimtex")
require("plugins.statusline")
require("plugins.autopairs")
require("plugins.dap")
-- require("plugins.indent")
require("plugins.fidget")
require("plugins.lspsaga")
require("plugins.latex")
require("plugins.formatter")
-- require("plugins.hover")
require("plugins.dressing")
require("plugins.telescope")
require("plugins.orgmode")
require("plugins.copilot")
require("plugins.comment")
require("plugins.cmake")
require("plugins.overseer")
require("plugins.nvimtree")

-- require('orgmode').setup_ts_grammar()
require("nvim-treesitter.configs").setup {
    auto_install = true,
    ignore_install = {},
    sync_install = false,
    modules = {},
    ensure_installed = {
        "lua", "vim", "go", "toml", "css", "tsx", "css", "html", "lua", "org"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = {'org'},
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat,
                                    vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end
    },

    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact',
            'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'css',
            'lua', 'xml', 'php', 'markdown'
        }
    },
    indent = {enable = true}
}

require("crates").setup();
require("rust-tools").setup({
    tools = {executor = require("rust-tools.executors").floaterm}
});
require("toggleterm").setup();
