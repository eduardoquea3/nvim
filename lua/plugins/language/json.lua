return {
  {
    "b0o/schemastore.nvim",
    ft = { "json", "jsonc" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lspconfig").jsonls.setup {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }
    end,
  },
}
