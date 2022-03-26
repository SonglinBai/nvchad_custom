local lsp_installer = require "nvim-lsp-installer"
lsp_installer.settings {
   ui = {
      icons = {
         server_installed = "✓",
         server_pending = "➜",
         server_uninstalled = "✗",
      },
   },
}

local enhance_server_opts = {
   ["sumneko_lua"] = function(opts)
      opts.settings = {
         Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
               library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               },
               maxPreload = 100000,
               preloadFileSize = 10000,
            },
            telemetry = { enable = false },
         },
      }
   end,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
lsp_installer.on_server_ready(function(server)
   local opts = {
      capabilities = capabilities,
      flags = { debounce_text_changes = 500 },
      -- on_attach = custom_attach,
   }

   if enhance_server_opts[server.name] then
      enhance_server_opts[server.name](opts)
   end

   server:setup(opts)
end)
