return {
  "supermaven-inc/supermaven-nvim",
  event = "User FileOpened",
  config = function()
    require("supermaven-nvim").setup {
      keymaps = {
        accept_suggestion = "<A-c>",
        accept_word = "<A-w>",
      },
    }
  end,
}
