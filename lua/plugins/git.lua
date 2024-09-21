return {
  {
    "lewis6991/gitsigns.nvim",
    -- opts = true,
    event = "User FileOpened",
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 200,
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    -- event = "User FileOpened",
    -- cmd
    config = true,
  },
}
