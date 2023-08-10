local M = {}

M.general = {
  n = {
    ["Q"] = { ":q!<CR>", "Quit" },
    ["<leader>gg"] = { ":LazyGit<CR>", "LazyGit" },
    ["<A-Up>"] = { "yyP", "Yank line up" },
    ["<A-Down>"] = { "yyp", "Yank line down" },
    ["<C-A-Up>"] = { ":m -2<CR>", "Move line up" }, -- "ddkP" deletes line if on top
    ["<C-A-Down>"] = { "ddp", "Move line down" },
  },
}

return M
