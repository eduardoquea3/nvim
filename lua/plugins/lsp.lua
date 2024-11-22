---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true, cmd = "Mason" },
    "williamboman/mason-lspconfig.nvim",
    { "hrsh7th/cmp-nvim-lsp" },
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

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local mason_lspconfig = require "mason-lspconfig"

    local handlers = require("plugins.lsp.handlers")
    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          handlers = handlers,
          capabilities = capabilities,
          -- on_attach = require("plugins.lsp.on_attach").on_attach,
          -- settings = require("plugins.lsp.servers")[server_name],
          -- filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
        }
      end,
    }

    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = true,
        folder_level = 0,
      },
      lightbulb = {
        enable = false,
      },
    }
  end,
}
