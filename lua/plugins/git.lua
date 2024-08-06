return {
  "lewis6991/gitsigns.nvim",
  -- opts = true,
  event = "User FileOpened",
  config = function()
    require("gitsigns").setup()
  end,
}
