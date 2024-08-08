return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User FileOpened",
  -- enabled = false,
  config = function()
    require("ibl").setup {
      indent = {
        char = { "|", "╎", "┆", "┊" },
      },
    }
  end,
}
