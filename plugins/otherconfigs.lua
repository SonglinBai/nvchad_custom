local M = {}

M.shade = function()
  local present, shade = pcall(require, "shade")

  if not present then
    return
  end

  shade.setup {
    overlay_opacity = 50,
    opacity_step = 1,
    exclude_filetypes = { "NvimTree" },
  }
end

M.autosave = function()
  local present, autosave = pcall(require, "autosave")

  if present then
    autosave.setup()
  end
end

M.neogit = function()
  local present, neogit = pcall(require, "neogit")

  if not present then
    return
  end
  neogit.setup {
    kind = "tab",
    integrations = {
      diffview = true,
    },
  }
end
M.diffview = function()
  local present, diffview = pcall(require, "diffview")

  if present then
    diffview.setup {}
  end
end

return M
