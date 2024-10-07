return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      -- sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-v>",
          node_incremental = "v",
          node_decremental = "V",
          scope_incremental = false,
        },
      },
      ensure_installed = {
        "c_sharp",
        "python",
        "html",
        "css",
        "java",
        "javascript",
        "json",
        "lua",
        "php",
        "php_only",
        "phpdoc",
        "toml",
        "luadoc",
        "typescript",
        "tsx",
        "json",
        "astro",
        "yaml",
        "http",
        "markdown",
        "markdown_inline",
        "kotlin",
        "latex",
        "xml",
        "graphql",
        "vim",
        "vimdoc",
        "rust",
        -- "powershell",
      },
    }
  end,
}
