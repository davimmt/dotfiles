local opts = {
  terminals = {
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.05,
        col = 0.05,
        width = 0.9,
        height = 0.85,
        -- border = "double",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

return opts
