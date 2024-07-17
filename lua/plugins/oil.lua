return {
  "stevearc/oil.nvim",
  lazy = true,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil" },
  },
  opts = {
    keymaps = {
      ["<c-l>"] = "actions.select",
      ["<c-h>"] = "actions.parent",
      -- ["<c-e>"] = "actions.select",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
