return {
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "User FileOpened",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  -- "numToStr/Comment.nvim",
  -- lazy = true,
  -- keys = {
  --   {"ff",mode = {"n","v"}, desc = "Comment line"},
  --   {"gb",mode = {"n","v"}, desc = "Comment Block"},
  -- },
  -- config = function ()
  --   require("Comment").setup({
  --     toggler = {
  --       line = "ff",
  --       block = "gb",
  --     },
  --     opleader = {
  --       line = "ff",
  --       block = "gb",
  --     }
  --   })
  -- end
}
