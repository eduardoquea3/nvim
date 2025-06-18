return {
  {
    "b0o/schemastore.nvim",
    ft = "yaml",
    config = function()
      -- require("lspconfig").yamlls.setup {
      --   settings = {
      --     yaml = {
      --       schemas = require("schemastore").yaml.schemas(),
      --     },
      --   },
      -- }
    end,
  },
}
