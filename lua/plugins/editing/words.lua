return {
  {
    "kylechui/nvim-surround",
    version = "*",
    keys = {
      "ysi",
      "ys",
      "ds",
      "cs",
      { "S", mode = "v" },
    },
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "smoka7/multicursors.nvim",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    keys = {
      {
        mode = { "v", "n" },
        "<c-d>",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
    config = function()
      local normal = require "multicursors.normal_mode"
      require("multicursors").setup {
        updatetime = 100,
        normal_keys = {
          ["<c-d>"] = {
            method = normal.find_next,
            opts = { desc = "Goto next" },
          },
          ["q"] = {
            method = normal.exit,
            opts = { desc = "Exit" },
          },
        },
      }
    end,
  },
}
