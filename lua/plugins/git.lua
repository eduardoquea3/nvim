return {
  {
    "lewis6991/gitsigns.nvim",
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
    config = true,
    keys = {
      { "<leader>gm", "<cmd>DiffviewOpen<cr>", desc = "Open Merge tool" },
    },
  },
}
