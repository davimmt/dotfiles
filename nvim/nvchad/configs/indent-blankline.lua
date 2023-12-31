vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  filetype_exclude = { 'dashboard', 'alpha', 'help', 'NvimTree', 'Trouble' },
  buftype_exclude = { "terminal", "nofile" },
  show_current_context = true,
  -- show_current_context_start = true,
  -- show_current_context_start_on_current_line = true,
  -- show_end_of_line = true,
  -- space_char_blankline = " ",
}
