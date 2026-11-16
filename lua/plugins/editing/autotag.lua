return {
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "astro", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
}
