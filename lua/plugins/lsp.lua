return {
  "neovim/nvim-lspconfig",
  event = { "User FileOpened" },
  dependencies = {
    { "mason-org/mason.nvim", config = true, cmd = "Mason" },
    "mason-org/mason-lspconfig.nvim",
    { "rachartier/tiny-code-action.nvim" },
    {
      "nvimdev/lspsaga.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
    },
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
      ensure_installed = vim.tbl_keys(require "plugins.lsp.servers"),
    }
    require("lspconfig.ui.windows").default_options.border = "rounded"

    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    }
  end,
  keys = {
    { "<leader>lm", "<cmd>Mason<cr>", desc = "Prev diagnostic" },
  },
}
