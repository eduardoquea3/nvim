return {
  "chrisgrieser/nvim-scissors",
  dependencies = { "nvim-telescope/telescope.nvim", "L3MON4D3/LuaSnip" },
  opts = {
    snippetDir = vim.fn.stdpath "config" .. "/snippets",
    editSnippetPopup = {
      keymaps = {
        deleteSnippet = "<A-d>",
      },
    },
  },
  keys = {
    {
      "<leader>ne",
      function()
        require("scissors").editSnippet()
      end,
      desc = "Edit Snippet",
    },
    {
      "<leader>na",
      function()
        require("scissors").addNewSnippet()
      end,
      desc = "Add New Snippet",
      mode = { "n", "x" },
    },
  },
}
