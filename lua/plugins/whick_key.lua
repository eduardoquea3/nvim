return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>a", ":WhichKey<cr>", desc = "Mostrar Atajos" },
  },
  config = function()
    require("which-key").setup()
    require "config.keymap"
  end,
}
