local present, wk = pcall(require, "which-key")
if not present then
  return
end
wk.register(
  {
    ["<leader>"] = {
      c = { name = " NvChad" },
      f = { name = "󰈞 Files/Telescope" },
      g = { name = " Git" },
      l = { name = " LSP" },
      n = { name = " NVim" },
      t = { name = " Terminal" },
      w = { name = "󰦄 Which Key" },
    },
  }
)
