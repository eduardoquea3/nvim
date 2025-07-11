return {
  "greggh/claude-code.nvim",
  enabled = function()
    return vim.loop.os_uname().sysname == "Linux"
  end,
  keys = {
    {
      "<c-b>",
      "<cmd>ClaudeCode<cr>",
      mode = { "n", "t" },
      desc = "Toggle Claude Code",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup {
      window = {
        position = "float",
      },
    }
  end,
}
