local config = {
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "dockerfile",
      "json",
      "regex",
      "terraform",
      "yaml",
      "go",
    },
    highlight = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
    }
  })
}

return config
