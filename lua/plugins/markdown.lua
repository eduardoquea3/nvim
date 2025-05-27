return {
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    -- enabled = false,
    event = "User FileOpened",
    ft = "markdown",
    config = function()
      local headings = require("markview.presets").headings
      local lines = require("markview.presets").horizontal_rules
      local tables = require("markview.presets").tables
      require("markview").setup {
        markdown = {
          headings = headings.simple,
          horizontal_rulers = lines.thick,
          tables = tables.rounded,
        },
      }
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
