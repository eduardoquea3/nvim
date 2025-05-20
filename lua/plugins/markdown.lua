return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- enabled = false,
    event = "User FileOpened",
    ft = "markdown",
    config = true,
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
