return {
  {
    "mason-org/mason.nvim",
    keys = {
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Open Mason" },
    },
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
}
