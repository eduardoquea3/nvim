return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim",
  },
  keys = {
    { "<leader>a", ":WhichKey<cr>", desc = "Mostrar Atajos" },
  },
  config = function()
    local wk = require "which-key"
    wk.setup {}
    wk.add {
      { "/", "<cmd>SearchBoxIncSearch<cr>", desc = "Search", remap = true },
      { "<Esc>", "<cmd>nohlsearch<cr>", desc = "No show results" },
      { "ss", "<cmd>split<cr>", desc = "Horizontal Split buffer" },
      { "sv", "<cmd>vsplit<cr>", desc = "Vertical Split buffer" },
      { "<leader>/", "gcc", desc = "Toggle Comment", remap = true },
      { "<leader>b", group = "Buffer or Split" },
      { "<leader>bd", "<cmd>bd<cr>", desc = "Buffer delete" },
      { "<leader>bs", "<cmd>close<cr>", desc = "Split delete" },
      { "<A-j>", "<cmd>execute 'move .+'  . v:count1<cr>==", desc = "Move down line" },
      { "<A-k>", "<cmd>execute 'move .-'  . (v:count1 + 1)<cr>==", desc = "Move up line" },
      { "<C-h>", "<C-w>h", desc = "Movement split" },
      { "<C-j>", "<C-w>j", desc = "Movement split" },
      { "<C-k>", "<C-w>k", desc = "Movement split" },
      { "<C-l>", "<C-w>l", desc = "Movement split" },
      { "<C-Up>", "<cmd>resize +2<cr>", desc = "Increase Window Height" },
      { "<C-Down>", "<cmd>resize -2<cr>", desc = "Decrease Window Height" },
      { "<C-Left>", "<cmd>vertical resize -2<cr>", desc = "Decrease Window Height" },
      { "<C-Right>", "<cmd>vertical resize +2<cr>", desc = "Increase Window Height" },
      { "<A-a>", "ggVG", desc = "Select all" },
      {
        mode = { "n", "v" },
        { "<leader>q", "<cmd>confirm qall<cr>", desc = "Quit" },
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
        { "<C-e>", "<CR>", desc = "Movement" },
      },
      {
        mode = "v",
        { "<leader>/", "gc", desc = "Toggle Comment", remap = true },
        { "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", desc = "Move Down" },
        { "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", desc = "Move Up" },
      },
      {
        mode = "i",
        { "<A-h>", "<left>", desc = "Movement" },
        { "<A-j>", "<down>", desc = "Movement" },
        { "<A-k>", "<up>", desc = "Movement" },
        { "<A-l>", "<right>", desc = "Movement" },
        { "<C-j>", "<esc><cmd>m .+1<cr>==gi", desc = "Movement down line" },
        { "<C-k>", "<esc><cmd>m .-2<cr>==gi", desc = "Movement up line" },
        { "<right>", "", desc = "Null" },
        { "<left>", "", desc = "Null" },
        { "<down>", "", desc = "Null" },
        { "<up>", "", desc = "Null" },
      },
      {
        mode = "c",
        { "<C-l>", "<Esc>", desc = "Escape" },
      },
      {
        mode = { "n", "v", "i" },
        {
          "<c-s>",
          function()
            vim.cmd "w"
            vim.notify "Saved"
          end,
          desc = "Save",
        },
        {
          "<C-p>s",
          function()
            vim.cmd "wall"
            vim.notify "Saved all"
          end,
          desc = "Save All",
        },
      },
    }

    wk.setup {
      triggers = {
        { "zz", mode = "n" },
      },
    }
    -- require "config.keymap"
  end,
}
