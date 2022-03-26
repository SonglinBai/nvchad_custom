local conf = require "custom.plugins.config"
return {
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  {
    "gelguy/wilder.nvim",
    event = "CmdLineEnter",
    config = conf.wilder,
    requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
  },
  {
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      require "custom.lsp"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = conf.null_ls,
  },
  {
    "TimUntersberger/neogit",
    opt = true,
    cmd = "Neogit",
    config = conf.neogit,
  },
  { "sindrets/diffview.nvim", opt = true, cmd = "DiffviewOpen", after = "neogit" },
  {
    "phaazon/hop.nvim",
    opt = true,
    branch = "v1",
    event = "BufRead",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "machakann/vim-sandwich",
    opt = true,
    event = "BufRead",
  },
  {
    "habamax/vim-godot",
    ft = { "gdscript" },
  },
}
