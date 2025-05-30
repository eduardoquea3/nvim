return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "foreground",
          tailwind = true,
          sass = { enable = false, parsers = { "css" } },
          virtualtext = "",
          virtualtext_inline = true,
          virtualtext_mode = "background",
          always_update = false,
        },
        buftypes = {},
        user_commands = true,
      }
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    keys = {
      { "cc", "<cmd>CccConvert<cr>", desc = "Color Convert" },
      { "<C-c>", "<cmd>CccPick<cr>", desc = "Color Picker", mode = { "i" } },
    },
    config = true,
  },
}
