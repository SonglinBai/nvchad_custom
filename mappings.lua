local M = {}
local map = vim.api.nvim_set_keymap

M.custom = {
   n = {
      ["n"] = { "nzzzv", "" },
      ["N"] = { "Nzzzv", "" },
      ["J"] = { "mzJ`z", "" },
   },
   v = {
      ["J"] = { ":m '>+1<cr>gv=gv", "" },
      ["K"] = { ":m '<-2<cr>gv=gv", "" },
      ["<"] = { "<gv", "" },
      [">"] = { ">gv", "" },
   },
}

M.telez = {
   n = {
      ["<leader>fz"] = { ":Telescope zoxide list<CR>", "  find zoxide" },
   },
}

M.hop = {
   n = {
      [",w"] = { ":HopWord<CR>", "hop find word" },
      [",j"] = { ":HopLine<CR>", "hop find line" },
      [",k"] = { ":HopLine<CR>", "hop find line" },
      [",c"] = { ":HopChar2<CR>", "hop find char2" },
      [",C"] = { ":HopChar1<CR>", "hop find char1" },
   },
}
map(
   "n",
   "f",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
   {}
)
map(
   "n",
   "F",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
   {}
)
map(
   "o",
   "f",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
   {}
)
map(
   "o",
   "f",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
   {}
)
map(
   "x",
   "t",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
   {}
)
map(
   "x",
   "T",
   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
   {}
)

return M
