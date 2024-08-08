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
    lazy = true,
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {
      hint_config = false,
    },
    cmd = { "MCstart", "MCvisual", "Mcclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<c-d>",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
