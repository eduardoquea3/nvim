vim.filetype.add {
  extension = {
    http = "http",
    todo = "markdown",
  },
  filename = {
    [".env"] = "sh",
  },
}

vim.lsp.enable {
  "biome",
  "jsonls",
  "yamlls",
  "lua_ls",
  "bashls",
  "ts_ls",
  "pylsp",
  "astro",
  "cssls",
  "emmet_ls",
  "html",
  "tailwindcss",
  "emmylua_ls",
}
