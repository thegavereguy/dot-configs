-- local status_ok, mason = pcall(require, "mason")
-- if not status_ok then
--	return
-- end

-- local status_ok, mason_lspconfig = pcall(require, "mason_lspconfig")
-- if not status_ok then
--	return
-- end
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()
mason_lspconfig.setup {
    automatic_enable = true
}

-- mason_lspconfig.setup_handlers {
-- 	function(server)
-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- 		local opts = {
-- 			capabilities = capabilities,
-- 			on_attach = require('lsp.handlers').on_attach,
-- 		}
--
-- 		if server == "sumneko_lua" then
-- 			local sumneko_opts = require("lsp.settings.sumneko_lua")
-- 			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 		end
-- 		if server == "rust_analyzer" then
-- 			local rust_opts = require("lsp.settings.rust")
-- 			opts = vim.tbl_deep_extend("force", rust_opts, opts)
-- 		end
-- 		lspconfig[server].setup(opts)
-- 	end
-- }
