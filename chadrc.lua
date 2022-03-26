local M = {}
local userPlugins = require "custom.plugins"

M.ui = {
  theme = "doom-chad",
  italic_comments = true,
}

M.options = {
  relativenumber = true,
}

M.plugins = {
  status = {
    colorizer = true,
    alpha = true,
  },
  options = {
    statusline = {
      style = "block",
    },
  },
  install = userPlugins,
}

vim.opt.shell = "powershell -NoLogo"

return M
