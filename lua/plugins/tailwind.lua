return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "themaxmarchuk/tailwindcss-colors.nvim",
  },
  keys = {
    { "<c-t>", "<cmd>TailwindColorsToggle<cr>", desc = "Toggle Tailwind" },
  },
  ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "astro" },
  config = function()
    require("tailwind-tools").setup {
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = require("eduardo.icons").ui.Circle .. " ",
        debounce = 100,
      },
      conceal = {
        enabled = true,
        symbol = "~",
        highlight = {
          fg = "#38bdf8",
        },
      },
    }
  end,
}
