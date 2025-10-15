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
  "astro",
  "biome",
  "jsonls",
  "yamlls",
  "lua_ls",
  "bashls",
  "ts_ls",
  "pyrefly",
  "astro",
  "cssls",
  "emmet_ls",
  "html",
  "tailwindcss",
  "emmylua_ls",
  "kulala_ls",
}
