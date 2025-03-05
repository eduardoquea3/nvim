---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true, cmd = "Mason" },
    "williamboman/mason-lspconfig.nvim",
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

    local mason_lspconfig = require "mason-lspconfig"

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local handlers = require "plugins.lsp.handlers"
    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          handlers = handlers,
          capabilities = capabilities,
        }
      end,
    }

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
