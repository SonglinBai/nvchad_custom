-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "D", "dg$")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>cc", ":Telescope <CR>")
map("n", ",w", ":HopWord<CR>")
map("n", ",j", ":HopLine<CR>")
map("n", ",k", ":HopLine<CR>")
map("n", ",C", ":HopChar1<CR>")
map("n", ",c", ":HopChar2<CR>")
map(
  "n",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
map(
  "n",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)
map(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
)
map(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
)
map(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
)
map(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
)

vim.g.godot_executable = "C:/Users/songl/bin/Godot_v3.4.3.exe"

-- require "custom.lsp"
-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
