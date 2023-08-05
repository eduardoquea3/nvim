local null_ls = require("null-ls")
local b = null_ls.builtins

null_ls.setup({
  sources = {
    --formatting
    b.formatting.autopep8,
    b.formatting.eslint.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }),
    b.formatting.prettier.with({
      filetypes = {
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
      },
    }),
    b.formatting.stylua.with({
      filetypes = {
        "lua",
      },
    }),

    --diagnostics
    b.diagnostics.eslint.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }),
    b.diagnostics.luacheck,
    b.diagnostics.flake8,
  },
})
