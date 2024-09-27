return {
  {
    "folke/lazydev.nvim",
    config = true,
    ft = "lua",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ft = "lua",
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
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
    "nvimtools/none-ls.nvim",
    ft = "lua",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require "null-ls"

      require("mason-null-ls").setup {
        ensure_installed = {
          "stylua",
          "phpcbf",
        },
      }

      local formatting = null_ls.builtins.formatting
      local config = vim.fn.stdpath "config"

      null_ls.setup {

        sources = {
          formatting.phpcbf,
          formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand(config .. "/stylua.toml") },
          },
        },
      }
    end,
  },
}
