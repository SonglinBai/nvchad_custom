local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local new_cmd = vim.api.nvim_create_user_command
local opt = vim.opt
local g = vim.g

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

autogroup("IMSelect", { clear = true })
autocmd("VimEnter", {
   group = "IMSelect",
   callback = function()
      vim.cmd ":silent :!im-select.exe 1033"
   end,
})
autocmd("InsertLeave", {
   group = "IMSelect",
   callback = require("custom.utils.im-select").InsertLeave,
})
autocmd("InsertEnter", {
   group = "IMSelect",
   callback = require("custom.utils.im-select").InsertEnter,
})

new_cmd("EnableShade", function()
   require("shade").setup()
end, {})

new_cmd("EnableAutosave", function()
   require("autosave").setup()
end, {})

if vim.fn.exists("g:neovide") then
   g.neovide_cursor_animation_length = 0
   g.neovide_cursor_antialiasing = false
   -- g.neovide_profiler = true
end
