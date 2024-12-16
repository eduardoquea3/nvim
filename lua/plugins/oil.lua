return {
  "stevearc/oil.nvim",
  -- lazy = true,
  keys = {
    { "<C-e>", "<cmd>Oil<cr>", desc = "Oil" },
  },
  opts = {
    keymaps = {
      ["<C-r>"] = "actions.refresh",
      ["<C-l>"] = "actions.select",
      ["<C-h>"] = "actions.parent",
      -- ["q"] = "actions.close",
      ["<C-q>"] = "actions.close",
      ["."] = "actions.toggle_hidden",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
