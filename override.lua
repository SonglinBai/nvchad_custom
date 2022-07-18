local M = {}

M.treesitter = {
   ensure_installed = {
      "vim",
      "markdown",
      "c",
      "lua",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

M.ui = {
   statusline = {
      separator_style = "default",
   },
}

return M
