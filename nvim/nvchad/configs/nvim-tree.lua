local options = {
  filters = {
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    git_ignored = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    preserve_window_proportions = true,
    adaptive_size = false,
    side = "left",
    width = 25,
    float = {
      enable = false,
    },
  },
  git = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",
    group_empty = true,

    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      }
    },

    icons = {
      git_placement = "signcolumn",
      modified_placement = "signcolumn",

      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "M",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return options
