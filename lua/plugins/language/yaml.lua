return {
  {
    "b0o/schemastore.nvim",
    ft = "yaml",
    config = function()
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
  },
}
