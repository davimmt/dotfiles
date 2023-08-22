---@type ChadrcConfig 
local M = {}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = 'ayu_dark',
  theme_toggle = {'catppuccin', 'ayu_dark'},
  telescope = { style = "bordered" },
  hl_add = {
    DashboardHeader = { fg = "#40ffff" },
    DashboardProjectTitle = { fg = "#40ffff" },
    DashboardProjectIcon = { fg = "#ffa0a0" },
    DashboardMruTitle = { fg = "#40ffff" },
    DashboardShotCutIcon = { fg = "#40ffff" },
    DashboardFooter = { fg = "#40ffff" },

    -- GitSignsAddLn = { bg = {"green", -45} },
    -- GitSignsChangeLn = { bg = {"yellow", -65} },
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
  view = {
    side = "right",
  },
}

return M
