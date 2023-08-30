-- require'lspconfig'.terraformls.setup {
--   root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl")
-- }

require'lspconfig'.terraform_lsp.setup {
  root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl")
}

require'lspconfig'.tflint.setup {
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
