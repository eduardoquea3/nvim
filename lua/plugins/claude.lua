return {
  "greggh/claude-code.nvim",
  enabled = function()
    return vim.loop.os_uname().sysname == "Linux"
  end,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup {
      window = {
        position = "float",
      },
    }
    vim.keymap.set({ "n", "t" }, "<c-b>", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
  end,
}
