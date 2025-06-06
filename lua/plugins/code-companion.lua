return {
  "olimorris/codecompanion.nvim",
  config = true,
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "github/copilot.vim",
  },
  event = "User FileOpened",
  keys = {
    { "<C-b>", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat", mode = { "n", "i", "v" } },
  },
}
