return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    -- enabled = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        install_dir = vim.fn.stdpath "data" .. "/site",
      }
      -- require("nvim-treesitter.configs").setup {
      --   ensure_installed = {
      --     "python",
      --     "html",
      --     "css",
      --     "javascript",
      --     "json",
      --     "lua",
      --     "toml",
      --     "luadoc",
      --     "typescript",
      --     "tsx",
      --     "astro",
      --     "yaml",
      --     "http",
      --     "markdown",
      --     "markdown_inline",
      --     "xml",
      --     "graphql",
      --     "regex",
      --     "prisma",
      --   },

      --   sync_install = false,

      --   auto_install = true,

      --   highlight = { enable = true },
      -- }
    end,
  },
}
