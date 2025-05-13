---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
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
    require("mason").setup {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }
    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_keys(require "plugins.lsp.servers"),
    }
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for server, config in pairs(require "plugins.lsp.servers") do
      vim.lsp.enable(server)
      vim.lsp.config(server, config)
    end

    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    }
  end,
}
