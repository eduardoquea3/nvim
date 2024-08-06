return {
  "hedyhli/outline.nvim",
  keys = { { "<leader>o", "<cmd>Outline<cr>", desc = "Toogle Outline" } },
  config = function()
    require("outline").setup()
  end,
}
