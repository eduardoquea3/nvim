return {
  {
    "folke/ts-comments.nvim",
    opts = {},

    event = "VeryLazy",
    enabled = function()
      local version = vim.fn.has "nvim-0.10.0" == 1
      local ft = vim.bo.filetype
      local ft_ok = false
      if ft == "javascriptreact" or ft == "typescriptreact" then
        ft_ok = true
      end
      return version and ft_ok and false
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "User FileOpened",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    enabled = function()
      local ft = vim.bo.filetype
      local ft_ok = true
      if ft == "javascriptreact" or ft == "typescriptreact" then
        ft_ok = false
      end
      return ft_ok
    end,
    opts = {},
    -- config = function()
    -- require("ts_context_commentstring").setup {
    --   enable_autocmd = false,
    -- }
    -- require("Comment").setup {
    --   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    -- }
    -- end,
  },
}
