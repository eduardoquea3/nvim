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
        "html",
        "css",
        "astro",
        "http",
        "markdown",
        "markdown_inline",
        "java",
        "kotlin",
        "latex",
        "luadoc",
        "xml",
        "json",
        "graphql",
        "vim",
        "vimdoc",
        "toml",
        "yaml",
        "rust",
        "php",
        "powershell",
        "c_sharp",
      },
    }
  end,
}
