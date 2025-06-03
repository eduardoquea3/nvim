return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "astro" },
  config = function()
    require("tailwind-tools").setup {
      document_color = {
        enabled = false,
        kind = "inline",
        inline_symbol = "󱓻 ",
        debounce = 200,
      },
      conceal = {
        enabled = true,
        symbol = "~",
        highlight = {
          fg = "#74c7ec",
        },
      },
    }
  end,
}
