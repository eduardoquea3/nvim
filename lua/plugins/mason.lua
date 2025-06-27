return {
  {
    "williamboman/mason.nvim",
    event = "User FileOpened",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "json-lsp",
        "yaml-language-server",
        "lua-language-server",
        "bash-language-server",
        "typescript-language-server",
        "python-lsp-server",
        "astro-language-server",
        "css-lsp",
        "emmet-language-server",
        "html-lsp",
        "tailwindcss-language-server",

        "biome",
        "selene",
        "ruff",
      },
    },
  },
}
