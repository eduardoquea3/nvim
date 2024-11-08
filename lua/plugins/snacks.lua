return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
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
  },
  keys = {
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
      "<leader>cR",
      function()
        require("snacks").rename()
      end,
      desc = "Rename File",
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
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          require("snacks").debug.inspect(...)
        end
        _G.bt = function()
          require("snacks").debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use require("snacks") for `:=` command

        -- Create some toggle mappings
        require("snacks").toggle.option("spell", { name = "Spelling" }):map "<leader>us"
        require("snacks").toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
        require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
        require("snacks").toggle.diagnostics():map "<leader>ud"
        require("snacks").toggle.line_number():map "<leader>ul"
        require("snacks").toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map "<leader>uc"
        require("snacks").toggle.treesitter():map "<leader>uT"
        require("snacks").toggle
          .option("background", { off = "light", on = "dark", name = "Dark Background" })
          :map "<leader>ub"
        require("snacks").toggle.inlay_hints():map "<leader>uh"
      end,
    })
  end,
}
