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
  ["kylechui/nvim-surround"] = {
    event = "BufRead",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          normal = "sa",
          delete = "sd",
          change = "sr",
        },
      }
    end,
  },
  ["jvgrootveld/telescope-zoxide"] = {
    requires = "nvim-telescope/telescope.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "zoxide"
    end,
  },
  ["pwntester/octo.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    cmd = "Octo",
    after = "telescope.nvim",
    config = function()
      require("octo").setup()
    end,
  },
  ["dstein64/vim-startuptime"] = {
    disable = true,
    cmd = "StartupTime",
  },
}
