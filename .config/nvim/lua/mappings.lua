require "nvchad.mappings"

-- disable mappings
local nomap = vim.keymap.del

-- toggle nvimtree
nomap("n", "<leader>e")
-- new/close buffer
nomap("n", "<leader>b")
nomap("n", "<leader>x")
-- comment
nomap("n", "<leader>/")
-- nvchad themes
nomap("n", "<leader>th")
-- nvchad cheatsheet
nomap("n", "<leader>ch")
-- pick a hidden term
nomap("n", "<leader>pt")
-- nvterm
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("t", "<ESC>")
-- line numbers
nomap("n", "<leader>rn")
-- telescope
nomap("n", "<leader>cm")
nomap("n", "<leader>gt")
nomap("n", "<leader>fm")
-- which-key
nomap("n", "<leader>wk")
nomap("n", "<leader>wK")

-- add mappings
local map = vim.keymap.set

-- term
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- normal movement
map("n", "Q", ":qa!<CR>", { desc = "Quit" })
map("n", "<leader>N", "<cmd> enew <CR>", { desc = "New file buffer" })
-- terminal
map("t", "<ESC>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
-- TODO(1): Try to change it to <C-w>
map("n", "<C-q>", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close file buffer" })
map("n", "<C-A-w>", "<cmd> lua require('which-key').show('\23', {mode = 'n', auto = true})<CR>", { desc = "Windows options" })
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
map("n", "<A-Up>", "yyP", { desc = "Yank line up" })
map("n", "<A-Down>", "yyp", { desc = "Yank line down" })
map("n", "<C-A-Up>", ":m -2<CR>", { desc = "Move line up" }) -- "ddkP" deletes line if on top
map("n", "<C-A-Down>", "ddp", { desc = "Move line down" })
map("n", "<C-A-s>", ":noa w <CR>", { desc = "Save file without formatting" })
map("n", "<C-T>", "<C-O>", { desc = "Go to last pointer" })
for i = 1, 9, 1 do map("n", string.format("<A-%s>", i), function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end, { desc = "Navegate between tabs"}) end
-- nvchad
map("n", "<leader>ct", "<cmd> Telescope themes <CR>", { desc = "NvChad Themes" })
map("n", "<leader>cc", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })
-- telescope
map("n", "<leader>fm", "<cmd> Telescope marks <CR>", { desc = "Telescope Bookmarks" })
map("n", "<leader>fg", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
-- nvim
map("n", "<leader>nn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
map("n", "<leader>nh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
-- which-key
map("n", "<leader>ww", function() vim.cmd "WhichKey" end, { desc = "Which-key all keymaps" })
-- lsp
map("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "LSP formatting" })
-- tabufline
map("n", "<A-Left>", function() require("nvchad.tabufline").move_buf(-1) end, { desc = "Move file buffer left" })
map("n", "<A-Right>", function() require("nvchad.tabufline").move_buf(1) end, { desc = "Move file buffer right" })
