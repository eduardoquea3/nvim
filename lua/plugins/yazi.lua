return {
  "DreamMaoMao/yazi.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>y", "<cmd>Yazi<cr>", desc = "Toggle yazi" },
  },
}
