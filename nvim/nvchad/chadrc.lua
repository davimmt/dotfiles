---@type ChadrcConfig 
local M = {}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = 'nightowl',
  theme_toggle = {'catppuccin', 'nightowl'},
  hl_add = {
    DashboardHeader = { fg = "#40ffff" },
    DashboardProjectTitle = { fg = "#40ffff" },
    DashboardProjectIcon = { fg = "#ffa0a0" },
    DashboardMruTitle = { fg = "#40ffff" },
    DashboardShotCutIcon = { fg = "#40ffff" },
    DashboardFooter = { fg = "#40ffff" },
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
