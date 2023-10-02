local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- lspconfig.terraformls.setup {
--   root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl")
-- }

lspconfig.terraform_lsp.setup {
  root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl")
}

lspconfig.tflint.setup {
  root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl")
}

local config = {
  vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars"},
    callback = function()
      vim.lsp.buf.format()
    end,
  })
}

return config
