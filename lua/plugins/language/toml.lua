return {
  {
    "stevearc/conform.nvim",
    ft = "toml",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "taplo" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        toml = { "taplo" },
      },
    },
  },
}
