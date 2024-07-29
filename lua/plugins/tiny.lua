return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "User FileOpened",
    config = function()
      local signs = {}
      if vim.g.neovide then
        signs = {
          left = "",
          right = "",
        }
      end
      require("tiny-inline-diagnostic").setup {
        signs = signs,
        blend = {
          factor = 0.22,
        },
      }
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
      require("tiny-code-action").setup {
        backend = "delta",
      }
    end,
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    branch = "main",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    -- enabled = false,
    config = function()
      require("tiny-devicons-auto-colors").setup()
    end,
  },
}
