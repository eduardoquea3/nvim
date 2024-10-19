return {
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    -- enabled = false,
    ft = "markdown",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        ft = "markdown",
      },
      {
        "nvim-tree/nvim-web-devicons",
        ft = "markdown",
      },
    },
    config = function()
      local mark = require "markview"
      local presets = require "markview.presets"

      mark.setup {
        headings = presets.headings.glow_labels,
      }
      vim.cmd "Markview enableAll"
    end,
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup {
        sync_install = true,
        ensure_installed = {
          "vim",
          "vimdoc",
        },
      }
    end,
  },
}
