return {
  "shellRaining/hlchunk.nvim",
  event = "User FileOpened",
  config = function()
    require("hlchunk").setup {
      indent = {
        enable = true,
        use_treesitter = false,
      },
      chunk = {
        enable = true,
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
