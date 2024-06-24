local opts = {
  ensure_installed = {
    -- terraform
    "terraform-ls",
    "tflint",
    -- go
    "gopls",
    "golines",
    "gofumpt",
    "goimports-reviser",
    -- python
    "black",
    "pyright",
    "python-lsp-server",
    -- js
    "eslint-lsp",
    "js-debug-adapter",
    "prettier",
    "typescript-language-server",
    -- helm
    "yaml-language-server",
    "helm-ls",
  },
}

return opts
