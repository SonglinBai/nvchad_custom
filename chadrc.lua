local M = {}

local opt = vim.opt

local override = require "custom.override"

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconfig = "custom.plugins.lspconfig",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   },

   user = require "custom.plugins",
}

M.ui = {
   theme = "gruvchad",
   theme_toggle = { "gruvchad", "gruvbox_light" },

   statusline = {
      separator_style = "block"
   }
}

M.options = {
   user = function()
      opt.shiftwidth = 4
      opt.relativenumber = true
   end,
}

M.mappings = require "custom.mappings"

return M
