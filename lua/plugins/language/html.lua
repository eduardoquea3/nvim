return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ft = { "html" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "prettier" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
      },
    },
  },
}
