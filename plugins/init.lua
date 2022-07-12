return {
   -- format & linting
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
   -- dim inactive windows
   ["andreadev-it/shade.nvim"] = {
      module = "shade",
      config = function()
         require("custom.plugins.otherconfigs").shade()
      end,
   },
   ["Pocco81/AutoSave.nvim"] = {
      module = "autosave",
      config = function()
         require("custom.plugins.otherconfigs").autosave()
      end,
   },
   ["TimUntersberger/neogit"] = {
      requires = "nvim-lua/plenary.nvim",
      cmd = "Neogit",
      config = function()
         require("custom.plugins.otherconfigs").neogit()
      end,
   },
   ["sindrets/diffview.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      cmd = "DiffviewOpen",
      after = "neogit",
      config = function()
         require("custom.plugins.otherconfigs").diffview()
      end,
   },
   ["phaazon/hop.nvim"] = {
      event = "BufRead",
      branch = "v2",
      config = function()
         require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      end,
   },
   ["machakann/vim-sandwich"] = {
      event = "BufRead",
   },
}
