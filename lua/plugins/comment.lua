return {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup({
      toggler = {
        line = "ff",
        block = "fb",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
    })
  end,
}
