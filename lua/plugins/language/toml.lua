return {
  {
    "stevearc/conform.nvim",
    ft = "toml",
    dependencies = {
      "mason-org/mason.nvim",
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
