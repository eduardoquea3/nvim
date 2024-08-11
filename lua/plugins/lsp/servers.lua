return {
  jsonls = {
    settings = {
      json = {
        schema = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        hint = {
          enable = true,
        },
      },
    },
  },
  bashls = {
    filetypes = { "sh", "zsh" },
  },
  tsserver = {},
  pylsp = {},

  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
  },
  astro = {},
  -- biome = {},
  cssls = {},
  emmet_ls = {
    filetypes = { "html", "astro", "javascriptreact", "aspx", "typescriptreact", "php" },
  },
  html = {
    -- filetypes = { "html" },
  },
  tailwindcss = {},
  jdtls = {},
  intelephense = {},
}
