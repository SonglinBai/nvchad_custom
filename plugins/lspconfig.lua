local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- local servers = { "html", "cssls", "bashls", "emmet_ls", "clangd", "pyright" }
   local servers = {}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         root_dir = vim.loop.cwd,
      }
   end
end

return M
