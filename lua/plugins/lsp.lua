return {
  {
    "neovim/nvim-lspconfig",
    event = { "User FileOpened" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function()
          local icons = require("eduardo.icons").ui
          return {
            ui = {
              border = "rounded",
              icons = {
                package_installed = icons.Check,
                package_pending = icons.DoubleChevronRight,
                package_uninstalled = icons.Close,
              },
            },
          }
        end,
      },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "jsonls",
            "yamlls",
            "lua_ls",
            "bashls",
            "ts_ls",
            "pylsp",
            "astro",
            "cssls",
            "emmet_ls",
            "html",
            "tailwindcss",
          },
        },
      },
    },
    config = function()
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
    keys = {
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Open Mason" },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = {
          enable = false,
        },
      }
    end,
  },
}
