return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "User FileOpened",
    config = function()
      require("tiny-inline-diagnostic").setup {}
    end,
  },
  {
    "Chaitanyabsprip/fastaction.nvim",
    event = "User FileOpened",
    config = function()
      require("fastaction").setup {}
      -- vim.keymap.set("n", "<leader>ca", function()
        -- require("fastaction").code_action()
      -- end, { noremap = true, silent = true })
      -- vim.keymap.set("v", "<leader>ca", function()
        -- require("fastaction").range_code_action()
      -- end, { noremap = true, silent = true })
    end,
  },
}
