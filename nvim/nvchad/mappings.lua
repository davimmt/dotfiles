local M = {}

-- check defaults in lua/core/mappings.lua
M.disabled = {
  n = {
    -- toggle nvimtree
    ["<leader>e"] = "",
    -- new/close buffer
    ["<leader>b"] = "",
    ["<leader>x"] = "",
    -- comment
    ["<leader>/"] = "",
    -- nvchad themes
    ["<leader>th"] = "",
    -- telescope bookmarks
    ["<leader>ma"] = "",
    -- pick a hidden term
    ["<leader>pt"] = "",
    -- nvterm
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    -- line numbers
    ["<leader>rn"] = "",
    -- telescope
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>fm"] = "",
  }
}

M.general = {
  n = {
    ["Q"] = { ":q!<CR>", "Quit" },
    ["<leader>N"] = { "<cmd> enew <CR>", "New file" },
    ["<leader>gg"] = { ":LazyGit<CR>", "LazyGit" },
    ["<A-Up>"] = { "yyP", "Yank line up" },
    ["<A-Down>"] = { "yyp", "Yank line down" },
    ["<C-A-Up>"] = { ":m -2<CR>", "Move line up" }, -- "ddkP" deletes line if on top
    ["<C-A-Down>"] = { "ddp", "Move line down" },
    ["<C-A-s>"] = { ":noa w <CR>", "Save file without " },
    -- nvchad
    ["<leader>ct"] = { "<cmd> Telescope themes <CR>", "NvChad Themes" },
    ["<leader>cc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    -- telescope
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Telescope Bookmarks" },
    ["<leader>fg"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    -- nvim
    ["<leader>nn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>nh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    -- which-key
    ["<leader>ww"] = { function() vim.cmd "WhichKey" end, "Which-key all keymaps" },
    -- lsp
    ["<leader>lf"] = { function() vim.lsp.buf.format { async = true } end, "LSP formatting" },
  },
}

return M
