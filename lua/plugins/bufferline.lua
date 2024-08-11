return {
  "akinsho/bufferline.nvim",
  -- event = "VeryLazy",
  event = "User FileOpened",
  -- keys = {
  --   { "<S-h>","<cmd>BufferLineCyclePrev<cr>",desc="Prev Buffer" },
  --   { "<S-l>","<cmd>BufferLineCycleNext<cr>",desc="Next Buffer" },
  -- },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        }
      },
    }
  },
  config = function(_,opts)
    require("bufferline").setup(opts)
  end,
}
