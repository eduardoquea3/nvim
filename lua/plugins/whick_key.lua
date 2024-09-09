return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>a", ":WhichKey<cr>", desc = "Mostrar Atajos" },
  },
  config = function()
    local wk = require "which-key"
    wk.setup {}
    wk.add {
      { "<Esc>", "<cmd>nohlsearch<cr>", desc = "No show results" },
      { "s", group = "New splits" },
      { "ss", "<cmd>split<cr>", desc = "Split buffer" },
      { "sv", "<cmd>vsplit<cr>", desc = "Vertical Split buffer" },
      { "<leader>b", group = "Buffer or Split" },
      { "<leader>bd", "<cmd>bd<cr>", desc = "Buffer delete" },
      { "<leader>bs", "<C-w>q", desc = "Split delete" },
      { "<C-w>", "<cmd>bp | bd #<cr>", desc = "Close file in  split" },
      { "<Tab>", "<cmd>bn<cr>", desc = "Tab next" },
      { "<S-Tab>", "<cmd>bp<cr>", desc = "Tab previous" },
      { "<C-a>", "ggVG", desc = "Select all" },
      { "<A-j>", ":m .+1<cr>==", desc = "Move down line" },
      { "<A-k>", ":m .-2<cr>==", desc = "Move up line" },
      { "<C-h>", "<C-w>h", desc = "Movement split" },
      { "<C-j>", "<C-w>j", desc = "Movement split" },
      { "<C-k>", "<C-w>k", desc = "Movement split" },
      { "<C-l>", "<C-w>l", desc = "Movement split" },
      {
        mode = { "n", "v" },
        { "<leader>q", "<cmd>confirm qall<cr>", desc = "Quit" },
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
      },
      {
        mode = { "v", "i" },
        { "<C-l>", "<Esc>", desc = "Mode Normal" },
      },
      {
        mode = "t",
        { "<C-l>", "<C-\\><C-n>", desc = "Mode Normal" },
        { "<C-j>", "<down>", desc = "Movement" },
        { "<C-k>", "<up>", desc = "Movement" },
      },
      {
      	mode = "i",
        { "<A-h>", "<left>", desc = "Movement" },
        { "<A-j>", "<down>", desc = "Movement" },
        { "<A-k>", "<up>", desc = "Movement" },
        { "<A-l>", "<right>", desc = "Movement" },
        { "<C-j>", "<Esc><cmd>m .+1<cr>==a", desc = "Movement down line" },
        { "<C-k>", "<Esc><cmd>m .-2<cr>==a", desc = "Movement up line" },
        { "<right>", "", desc = "Null" },
        { "<left>", "", desc = "Null" },
        { "<down>", "", desc = "Null" },
        { "<up>", "", desc = "Null" },
      }
    }
    -- require "config.keymap"
  end,
}
