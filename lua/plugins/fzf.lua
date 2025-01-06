return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fzf Files" },
  },
  opts = function()
    local action = require "fzf-lua.actions"

    return {
      winopts = {
        fullscreen = false,
        treesitter = {
          enabled = true,
        },
      },
    }
  end,
}
