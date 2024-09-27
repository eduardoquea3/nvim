return {
  {
    "nvim-treesitter/nvim-treesitter",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "json",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "rshkarin/mason-nvim-lint",
        opts = {
          ensure_installed = { "biome" },
        },
      },
    },
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        jsonc = { "biome" },
        json = { "biome" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "biome" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "biome", "biome-check" },
        typescript = { "biome", "biome-check" },
        javascriptreact = { "biome", "biome-check" },
        typescriptreact = { "biome", "biome-check" },
        jsonc = { "biome", "biome-check" },
        json = { "biome", "biome-check" },
      },
    },
  },
}
