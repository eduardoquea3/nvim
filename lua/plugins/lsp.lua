return {
  {
    "neovim/nvim-lspconfig",
    event = { "User FileOpened" },
    dependencies = {
      { "mason-org/mason.nvim", config = true, cmd = "Mason" },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local icons = require("eduardo.icons").ui
      require("mason").setup {
        ui = {
          border = "rounded",
          icons = {
            package_installed = icons.Check,
            package_pending = icons.DoubleChevronRight,
            package_uninstalled = icons.Close,
          },
        },
      }
      require("mason-lspconfig").setup {
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
        automatic_installation = true,
      }

      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
    keys = {
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Prev diagnostic" },
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
