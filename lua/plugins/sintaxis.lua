return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "c_sharp",
          "cpp",
          "css",
          "dart",
          "html",
          "http",
          "java",
          "javascript",
          "json",
          "kotlin",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "sql",
          "svelte",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "vue",
        },
        ignore_install = { "luadoc", "wgsl_bevy" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
      })
    end,
  },
  "tpope/vim-surround",
  "mg979/vim-visual-multi",
}
