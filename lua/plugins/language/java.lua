return {
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "rshkarin/mason-nvim-lint",
        opts = {
          ensure_installed = { "checkstyle" },
        },
      },
    },
    ft = "java",
    config = function()
      require("lint").linters_by_ft = {
        java = { "checkstyle" },
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
    ft = "java",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "google-java-format" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
}
