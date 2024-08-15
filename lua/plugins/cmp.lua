return {
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "davidmh/cmp-nerdfonts",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",

      -- Adds vscode-like pictograms
      "onsails/lspkind.nvim",
      {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = true,
        ft = { "html", "javascriptreact", "typescriptreact", "astro" },
      },
    },
    config = function()
      require "eduardo.cmp"
    end,
  },
  -- {
  --   "js-everts/cmp-tailwind-colors",
  --   opts = {
  --     enable_alpha = true,
  --     format = function(itemColor)
  --       return {
  --         fg = itemColor,
  --         bg = itemColor,
  --         text = "  ",
  --       }
  --     end,
  --   },
  --   ft = { "astro", "html", "javascriptreact", "typesciptreact" },
  -- },
}
