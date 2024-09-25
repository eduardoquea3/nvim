return {
  -- jsonls = {
  --   settings = {
  --     json = {
  --       schema = require("schemastore").json.schemas(),
  --       validate = { enable = true },
  --     },
  --   },
  -- },
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
  ts_ls = {},
  pylsp = {},
  -- pyright = {},

  -- yamlls = {
    -- cmd = { "yaml-language-server", "--stdio" },
    -- filetypes = { "yaml" },
  -- },
  astro = {},
  -- biome = {},
  cssls = {},
  emmet_ls = {
    filetypes = { "html", "astro", "javascriptreact", "aspx", "typescriptreact", "php", "jsp" },
  },
  html = {
    -- filetypes = { "html" },
  },
  tailwindcss = {},
  -- jdtls = {
  -- filetypes = { "java", "jsp" },
  -- },
  intelephense = {},
  -- phpactor = {},
  powershell_es = {},
  -- sqlls = {},
}
