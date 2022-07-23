local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- local servers = { "html", "cssls", "bashls", "emmet_ls", "clangd", "pyright" }
  -- local servers = { "clangd" }
  --
  -- for _, lsp in ipairs(servers) do
  --    lspconfig[lsp].setup {
  --       on_attach = attach,
  --       capabilities = capabilities,
  --       root_dir = vim.loop.cwd,
  --    }
  -- end
  lspconfig.clangd.setup {
    on_attach = attach,
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--compile-commands-dir=build",
      "--offset-encoding=utf-16",
      "--background-index",
      "--pch-storage=memory",
      "--clang-tidy",
      "--suggest-missing-includes",
    },
  }
end

return M
