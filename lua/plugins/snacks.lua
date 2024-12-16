return {
  "folke/snacks.nvim",
  -- priority = 1000,
  -- lazy = true,
  event = "User FileOpened",
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    dim = { enabled = true },
  },
  keys = {
    {
      "<leader>t",
      function()
        require("snacks").toggle.dim():toggle()
      end,
      desc = "Dim",
    },
    {
      "<leader>z",
      function()
        require("snacks").toggle.zen():toggle()
      end,
      desc = "Zen Mode",
    },
    {
      "<leader>gg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gB",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gf",
      function()
        require("snacks").lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "]]",
      function()
        require("snacks").words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
    },
    {
      "[[",
      function()
        require("snacks").words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        require("snacks").win {
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        }
      end,
    },
    {
      "<leader>us",
      desc = "Toggle Spell",
      function()
        require("snacks").toggle.option("spell", { name = "Spelling" }):toggle()
      end,
    },
    {
      "<leader>uw",
      desc = "Toggle Wrap",
      function()
        require("snacks").toggle.option("wrap", { name = "Wrap" }):toggle()
      end,
    },
    {
      "<leader>uL",
      desc = "Toggle Relative Line Numbers",
      function()
        require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):toggle()
      end,
    },
    {
      "<leader>ud",
      desc = "Toggle Diagnostics",
      function()
        require("snacks").toggle.diagnostics():toggle()
      end,
    },
    {
      "<leader>ul",
      desc = "Toggle Line Numbers",
      function()
        require("snacks").toggle.line_number():toggle()
      end,
    },
    {
      "<leader>uc",
      desc = "Toggle Conceal",
      function()
        require("snacks").toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :toggle()
      end,
    },
    {
      "<leader>uh",
      desc = "Toggle Inlay Hints",
      function()
        require("snacks").toggle.inlay_hints():toggle()
      end,
    },
    {
      "<leader>ut",
      desc = "Toggle Treesitter",
      function()
        require("snacks").toggle.treesitter():toggle()
      end,
    },
  },
}
