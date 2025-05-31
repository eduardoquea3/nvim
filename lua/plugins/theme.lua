return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup {
        transparent = true,
        overrides = function(colors)
          local palette = colors.palette
          return {
            BlinkCmpMenu = { bg = "none" },
            BlinkCmpDoc = { bg = "none" },
          }
        end,
      }
      vim.cmd.colorscheme "kanso-zen"
    end,
  },
}
