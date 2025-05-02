return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- enabled = false,
    ft = "markdown",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = true,
    -- config = function()
    --   local mark = require "markview"
    --   -- local presets = require "markview.presets"
    --   local headings = require "eduardo.markdown.heading"
    --
    --   mark.setup {
    --     headings = headings,
    --   }
    --   vim.cmd "Markview enableAll"
    --
    --   vim.keymap.set("n", "<leader>m", function()
    --     vim.cmd "Markview toggleAll"
    --     vim.notify "Markview toggled"
    --   end, { desc = "Toggle Markview" })
    -- end,
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
