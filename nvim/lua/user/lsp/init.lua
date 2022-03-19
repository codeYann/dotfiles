local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

nvim_lsp.denols.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	root_dir = nvim_lsp.util.root_pattern("deno.json"),
	init_options = {
		lint = true,
	},
})

nvim_lsp.tsserver.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	init_options = {
		lint = true,
	},
})

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
