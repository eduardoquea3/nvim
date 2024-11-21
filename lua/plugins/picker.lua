return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = "background", -- Set the display mode
          tailwind = true, -- Enable tailwind colors
          sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
          virtualtext = "",
          virtualtext_inline = false,
          virtualtext_mode = "foreground",
          always_update = false,
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
        -- Boolean | List of usercommands to enable
        user_commands = true, -- Enable all or some usercommands
      }
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    keys = {
      -- { "cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
      { "cc", "<cmd>CccConvert<cr>", desc = "Color Convert" },
      { "<C-c>", "<cmd>CccPick<cr>", desc = "Color Picker", mode = { "i" } },
    },
    config = true,
  },
}
