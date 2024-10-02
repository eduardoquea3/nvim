return {
  {
    "mfussenegger/nvim-lint",
    ft = "php",
    dependencies = {
      "williamboman/mason.nvim",
      "rshkarin/mason-nvim-lint",
    },
    config = function()
      require("lint").linters_by_ft = {
        php = { "php" },
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
    ft = "php",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "phpcbf" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
    },
  },
}
