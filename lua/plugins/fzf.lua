return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = {
    -- { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fzf Files" },
    -- { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Fzf Oldfiles" },
    -- { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Fzf Live Grep" },
    { "<leader>fm", "<cmd>FzfLua keymaps<cr>", desc = "Fzf Keymaps" },
    { "<leader>fm", "<cmd>FzfLua keymaps<cr>", desc = "Fzf Keymaps" },
    { "<leader>fB", "<cmd>FzfLua builtin<cr>", desc = "Fzf Builtin" },
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
