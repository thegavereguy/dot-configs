-- LaTeX buffer settings.
-- Completion is provided by blink.cmp (see lua/plugins/completion.lua);
-- compilation/viewing + omni completion come from vimtex (lua/plugins/latex.lua).
-- vimtex defaults (localleader is ","): ,ll compile · ,lv view · ,le errors
--                                        ,lk stop   · ,lt toc  · ,lc clean

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en", "it" }
vim.opt_local.conceallevel = 0
