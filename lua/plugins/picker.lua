return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          names = false,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "virtualtext",
          tailwind = true,
          tailwind_opts = {
            update_names = true,
          },
          sass = { enable = false, parsers = { "css" } },
          virtualtext = "󱓻",
          virtualtext_inline = "before",
          virtualtext_mode = "foreground",
          always_update = true,
        },
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
