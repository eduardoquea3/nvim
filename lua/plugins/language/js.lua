return {
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
      require("lint").linters.biome.args = { "--config-path", vim.fn.stdpath "config" .. "/biome.json" }
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
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        jsonc = { "biome" },
        json = { "biome" },
      },
    },
    config = function(_, opts)
      local format = require "conform"
      format.setup(opts)
      local conf = vim.fn.stdpath "config"
      format.formatters.biome = {
        prepend_args = { "--config-path", conf .. "/biome.json" },
      }
    end,
  },
}
