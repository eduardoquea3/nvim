return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "mfussenegger/nvim-dap", ft = "python" },
      { "mfussenegger/nvim-dap-python", ft = "python" },
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    branch = "regexp",
    config = function()
      require("venv-selector").setup()
      vim.keymap.set(
        "n",
        ",v",
        "<cmd>VenvSelect<cr>",
        { noremap = true, nowait = true, silent = true, desc = "Select Venv" }
      )
    end,
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "rshkarin/mason-nvim-lint",
        opts = {
          ensure_installed = { "ruff" },
        },
      },
    },
    ft = "python",
    config = function()
      require("lint").linters_by_ft = {
        python = { "ruff" },
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
    ft = "python",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = { "ruff" },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
    config = function(_, opts)
      local format = require "conform"
      format.setup(opts)
      local conf = vim.fn.stdpath "config"
      format.formatters.ruff_format = {
        prepend_args = { "--config", conf .. "/ruff.toml" },
      }
    end,
  },
}
