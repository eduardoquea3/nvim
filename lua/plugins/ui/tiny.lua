return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    config = function()
      require("tiny-inline-diagnostic").setup {
        preset = "minimal",
      }
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "LspAttach",
    opts = {
      backend = "delta",
      picker = "select",
    },
  },
}
