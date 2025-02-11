return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>a", ":WhichKey<cr>", desc = "Mostrar Atajos" },
  },
  config = function()
    local wk = require "which-key"
    local function has_neotree()
      return vim.fn.bufwinnr "neo-tree" ~= -1
    end
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
      {
        "<C-w>",
        function()
          local splits = vim.fn.winnr "$"
          local bufs = #vim.fn.getbufinfo { buflisted = 1 }
          local neotree = has_neotree()

          if bufs > 1 and neotree then
            vim.cmd "Neotree toggle"
            vim.api.nvim_buf_delete(0, { force = true })
            return
          end

          if bufs == 1 and splits == 1 then
            vim.api.nvim_buf_delete(0, { force = true })
            return
          end

          if bufs == 1 and neotree then
            vim.cmd "Neotree toggle"
            vim.api.nvim_buf_delete(0, { force = true })
            return
          end

          if bufs == 1 and splits > 1 and not neotree then
            vim.cmd "close"
            return
          end

          if bufs > 1 then
            vim.cmd "bp | bd #"
          end
        end,
        desc = "Split delete",
      },
      { "<A-j>", ":m .+1<cr>==", desc = "Move down line" },
      { "<A-k>", ":m .-2<cr>==", desc = "Move up line" },
      { "<C-h>", "<C-w>h", desc = "Movement split" },
      { "<C-j>", "<C-w>j", desc = "Movement split" },
      { "<C-k>", "<C-w>k", desc = "Movement split" },
      { "<C-l>", "<C-w>l", desc = "Movement split" },
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
      },
      {
        mode = "i",
        { "<A-h>", "<left>", desc = "Movement" },
        { "<A-j>", "<down>", desc = "Movement" },
        { "<A-k>", "<up>", desc = "Movement" },
        { "<A-l>", "<right>", desc = "Movement" },
        { "<C-j>", "<Esc><cmd>m .+7<cr>==a", desc = "Movement down line" },
        { "<C-k>", "<Esc><cmd>m .4<cr>==a", desc = "Movement up line" },
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
      },
    }
    -- require "config.keymap"
  end,
}
