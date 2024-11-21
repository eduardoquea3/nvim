return {
  {
    "Chaitanyabsprip/fastaction.nvim",
    event = "User FileOpened",
    config = function()
      require("fastaction").setup {}
    end,
  },
}
