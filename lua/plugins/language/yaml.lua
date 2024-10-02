return {
  {
    "b0o/schemastore.nvim",
    ft = "yaml",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lspconfig").yamlls.setup {
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      }
    end,
  },
}
