local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("dt.lsp.lsp-installer")
require("dt.lsp.handlers").setup()
