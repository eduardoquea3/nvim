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
      require("nvim-treesitter").install {
        "rust",
        "javascript",
        "zig",
        "python",
        "html",
        "css",
        "json",
        "lua",
        "toml",
        "luadoc",
        "typescript",
        "tsx",
        "astro",
        "yaml",
        "http",
        "markdown",
        "markdown_inline",
        "xml",
        "graphql",
        "regex",
        "prisma",
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "lua",
          "prima",
          "rust",
          "zig",
          "python",
          "html",
          "css",
          "javascript",
          "json",
          "toml",
          "typescript",
          "tsx",
          "astro",
          "yaml",
          "http",
          "markdown",
          "xml",
          "prisma",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
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
