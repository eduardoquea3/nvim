return {
  "stevearc/oil.nvim",
  -- lazy = true,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil" },
  },
  opts = {
    keymaps = {
      ["<C-r>"] = "actions.refresh",
      ["<C-l>"] = "actions.select",
      ["<C-h>"] = "actions.parent",
      ["q"] = "actions.close",
      ["."] = "actions.toggle_hidden",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
