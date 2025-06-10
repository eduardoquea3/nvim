return {
  "olimorris/codecompanion.nvim",
  config = true,
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "github/copilot.vim",
      config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<A-c>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
        vim.g.copilot_filetypes = {
          ["*"] = false,
          ["markdown"] = true,
          ["text"] = true,
          ["html"] = true,
          ["javascript"] = true,
          ["typescript"] = true,
          ["python"] = true,
          ["lua"] = true,
        }
      end,
    },
  },
  event = "User FileOpened",
  keys = {
    { "<C-b>", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat", mode = { "n", "i", "v" } },
  },
}
