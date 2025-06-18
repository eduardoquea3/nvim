return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  settings = {},
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" },
  },
}
