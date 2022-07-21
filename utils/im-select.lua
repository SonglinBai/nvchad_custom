local M = {}

M.defaultIM = "1033"
M.previousIM = M.defaultIM

M.InsertLeave = function()
   M.previousIM = vim.fn.system({"im-select"})
   vim.cmd (":silent :!im-select.exe".." "..M.defaultIM)
end

M.InsertEnter = function()
   vim.cmd (":silent :!im-select.exe".." "..M.previousIM)
end

return M
