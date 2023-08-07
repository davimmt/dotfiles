local config = {
  require("nvterm").setup({
    terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = 'editor',
          row = 1,
          col = 1,
          width = 1,
          height = 0.9,
          border = "double",
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
  })
}

return config
