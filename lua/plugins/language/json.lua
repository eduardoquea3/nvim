return {
  {
    "b0o/schemastore.nvim",
    ft = { "json", "jsonc" },
    config = function()
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,
  },
}
