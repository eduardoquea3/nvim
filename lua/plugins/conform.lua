return {
  "stevearc/conform.nvim",
  ft = {
    "lua",
    "css",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "jsonc",
    "json",
    "python",
    "toml",
  },
  dependencies = {
    "mason-org/mason.nvim",
    {
      "zapling/mason-conform.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "prettier",
          "biome",
          "ruff_format",
          "ruff_organize_imports",
          "taplo",
        },
      },
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      jsonc = { "biome" },
      json = { "biome" },
      python = { "ruff_format", "ruff_organize_imports" },
      toml = { "taplo" },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
    end
    map("<a-s>", function()
      require("conform").format { async = true }
      vim.notify "Formateado"
    end, "Formatear archivo")
  end,
}
