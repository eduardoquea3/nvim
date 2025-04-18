return {
  {
    "folke/lazydev.nvim",
    event = "User FileOpened",
    ft = "lua",
    dependencies = {
      "neovim/nvim-lspconfig",
      "justinsgithub/wezterm-types",
    },
    opts = {
      { path = "wezterm-types", mods = { "wezterm" } },
    },
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "rshkarin/mason-nvim-lint",
        opts = {
          ensure_installed = { "selene" },
        },
      },
    },
    ft = "lua",
    config = function()
      require("lint").linters_by_ft = {
        lua = { "selene" },
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
    ft = "lua",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "stylua" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
    config = function(_, opts)
      local format = require "conform"
      format.setup(opts)
      local conf = vim.fn.stdpath "config"
      format.formatters.stylua = {
        args = { "--config-path=" .. conf .. "/stylua.toml" },
      }
    end,
  },
}
