return {
  cmd = { "biome", "lsp-proxy" },
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "svelte",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "vue",
  },
  root_dir = function(bufnr, on_dir)
    local toolchain = require "config.toolchain"
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local selected_toolchain, root = toolchain.detect(filename)

    if selected_toolchain == "biome" then
      on_dir(root)
    end
  end,
  root_markers = { "package.json", ".git", "biome.json" },
}
