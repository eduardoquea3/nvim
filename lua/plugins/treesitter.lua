return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      sync_install = false,
      ignore_install = { "javascript" },
      modules = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      auto_install = true,
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
        "python",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
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
        "latex",
        "xml",
        "graphql",
        "regex",
      },
    }
  end,
}
