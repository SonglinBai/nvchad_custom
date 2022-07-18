local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local new_cmd = vim.api.nvim_create_user_command
local opt = vim.opt

autogroup("setIndent", { clear = true })
autocmd("FileType", {
   group = "setIndent",
   pattern = "lua",
   command = "setlocal shiftwidth=3 tabstop=3",
})

autogroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
   group = "YankHighlight",
   callback = function()
      vim.highlight.on_yank { higroup = "IncSearch", timeout = "300" }
   end,
})

new_cmd("EnableShade", function()
   require("shade").setup()
end, {})

new_cmd("EnableAutosave", function()
   require("autosave").setup()
end, {})
