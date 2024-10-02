return {
  {
    "stevearc/conform.nvim",
    ft = { "css" },
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
        css = { "prettier" },
      },
    },
  },
}
