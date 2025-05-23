return {
  "folke/snacks.nvim",
  event = "VimEnter",
  priority = 1000,
  opts = {
    bufdelete = { enabled = true },
    -- scroll = { enabled = true },
    bigfile = { enabled = true },
    terminal = { enabled = true },
    image = { enabled = true },
    dashboard = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    explorer = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<c-e>"] = { "confirm", mode = { "n", "i" } },
            ["<c-q>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right",
            },
          },
        },
      },
    },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    dim = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    {
      "<C-w>",
      function()
        Snacks.bufdelete.delete()
      end,
      desc = "Split delete",
    },
    {
      "<leader>fB",
      function()
        Snacks.picker.help() {}
      end,
      desc = "Help Tag Picker",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers() {}
      end,
      desc = "Keymap Picker",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.keymaps {}
      end,
      desc = "Keymap Picker",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files {}
      end,
      desc = "File Picker",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent Picker",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep Picker",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification Picker",
    },
    {
      "<c-p>W",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete All Other Buffers",
    },
    {
      "<c-p>w",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Delete All Buffers",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer",
    },
    {
      "<leader>t",
      function()
        Snacks.toggle.dim():toggle()
      end,
      desc = "Dim",
    },
    {
      "<leader>z",
      function()
        Snacks.toggle.zen():toggle()
      end,
      desc = "Zen Mode",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win {
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
        Snacks.toggle.option("spell", { name = "Spelling" }):toggle()
      end,
    },
    {
      "<leader>uw",
      desc = "Toggle Wrap",
      function()
        Snacks.toggle.option("wrap", { name = "Wrap" }):toggle()
      end,
    },
    {
      "<leader>uL",
      desc = "Toggle Relative Line Numbers",
      function()
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):toggle()
      end,
    },
    {
      "<leader>ud",
      desc = "Toggle Diagnostics",
      function()
        Snacks.toggle.diagnostics():toggle()
      end,
    },
    {
      "<leader>ul",
      desc = "Toggle Line Numbers",
      function()
        Snacks.toggle.line_number():toggle()
      end,
    },
    {
      "<leader>uc",
      desc = "Toggle Conceal",
      function()
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :toggle()
      end,
    },
    {
      "<leader>uh",
      desc = "Toggle Inlay Hints",
      function()
        Snacks.toggle.inlay_hints():toggle()
      end,
    },
    {
      "<leader>ut",
      desc = "Toggle Treesitter",
      function()
        Snacks.toggle.treesitter():toggle()
      end,
    },
  },
}
