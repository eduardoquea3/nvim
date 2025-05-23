return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "User FileOpened",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
    config = function()
      require("multicursors").setup {
        updatetime = 100,
      }
    end,
  },
}
