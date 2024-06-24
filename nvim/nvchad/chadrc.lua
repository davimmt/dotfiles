---@type ChadrcConfig 
local M = {}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

M.ui = {
  theme = 'pastelDark',
  theme_toggle = {'catppuccin', 'pastelDark'},
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
  hl_override = {
    NvimTreeGitNew = { fg = "green" },
    NvimTreeGitDirty = { fg = "orange" },
  },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "default",
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

return M
