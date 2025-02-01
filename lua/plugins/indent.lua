return {
  "shellRaining/hlchunk.nvim",
  enabled = false,
  event = "User FileOpened",
  config = function()
    require("hlchunk").setup {
      indent = {
        enable = false,
        use_treesitter = false,
      },
      chunk = {
        enable = false,
        style = {
          { fg = "#a9b665" },
        },
        use_treesitter = true,
        textobject = "",
        delay = 0,
      },
    }
  end,
}
