return {
  "rmagatti/alternate-toggler",
  keys = { { "<leader>i", "<cmd>ToggleAlternate<cr>", desc = "Toggle Boolean" } },
  config = function()
    require("alternate-toggler").setup()
  end,
  lazy = true,
}
