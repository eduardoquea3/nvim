return {
  {
    "kevinhwang91/nvim-ufo",
    event = "User FileOpened",
    dependencies = "kevinhwang91/promise-async",
    keys = {
      { "<C-c>", "zc", desc = "Cerrar en el pliegue" },
      { "<C-a>", "zo", desc = "Abrir en el pliegue" },
    },
    opts = {
      open_fold_hl_timeout = 150,
      preview = {
        win_config = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:Normal",
          winblend = 0,
        },
        mappings = {
          scrollY = "<C-k>",
          scrollE = "<C-j>",
        },
      },
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    config = function(_, opts)
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup(opts)
      vim.keymap.set("n", "<C-m>", function()
        local win = require("ufo").peekFoldedLinesUnderCursor()
        if not win then
          vim.notify "No se encontraron pliegues"
        end
      end, { desc = "Previsualizar pliegue", silent = true, noremap = true })
    end,
  },
}
