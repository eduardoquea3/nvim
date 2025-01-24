return {
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "User FileOpened",
  },
  -- {
  --   "numToStr/Comment.nvim",
  --   event = "User FileOpened",
  --   dependencies = {
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --   },
  --   enabled = function()
  --     local ft = vim.bo.filetype
  --     local ft_ok = true
  --     if ft == "javascriptreact" or ft == "typescriptreact" then
  --       ft_ok = false
  --     end
  --     return ft_ok
  --   end,
  --   opts = {},
  -- config = function()
  -- require("ts_context_commentstring").setup {
  --   enable_autocmd = false,
  -- }
  -- require("Comment").setup {
  --   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  -- }
  -- end,
  -- },
}
