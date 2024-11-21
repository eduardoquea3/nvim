return {
  "akinsho/bufferline.nvim",
  event = "User FileOpened",
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Bufferline cycle next", mode = "n" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Bufferline cycle prev", mode = "n" },
    { "<M-/>", "<cmd>BufferLinePick<cr>", desc = "Bufferline pick", mode = "n" },
    { "<M-c>", "<cmd>BufferLinePickClose<cr>", desc = "Bufferline close", mode = "n" },
    { "<C-k>w", "<cmd>BufferLineCloseOthers<cr>", desc = "Bufferline close others", mode = "n" },
  },
  opts = {
    options = {
      mode = "buffers",
      show_tab_indicators = false,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      indicator = {
        icon = "▎",
        style = "icon",
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
