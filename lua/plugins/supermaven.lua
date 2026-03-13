return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  enabled = vim.g.supermaven,
  config = function()
    require("supermaven-nvim").setup {
      keymaps = {
        accept_suggestion = "<A-l>",
        accept_word = "<A-w>",
      },
    }
  end,
}
