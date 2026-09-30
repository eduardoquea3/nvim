return {
  {
    url = "https://gitlab.com/eduardoquea3/kulala.nvim.git",
    ft = { "http", "rest", "javascript", "lua" },
    event = { "SessionLoadPost", "VimLeavePre" },
    opts = {
      global_keymaps = {
        ["Send request"] = { -- sets global mapping
          "<leader>hr",
          function()
            require("kulala").run()
          end,
          mode = { "n", "v" }, -- optional mode, default is n
          desc = "Send request", -- optional description, otherwise inferred from the key
        },
        ["Send all requests"] = {
          "<leader>hl",
          function()
            require("kulala").run_all()
          end,
          mode = { "n", "v" },
          ft = "http", -- sets mapping for *.http files only
        },
        ["Replay the last request"] = {
          "<leader>hd",
          function()
            require("kulala").replay()
          end,
          ft = { "http", "rest" }, -- sets mapping for specified file types
        },
        ["Find request"] = false, -- set to false to disable
      },
    },
    config = function(_, opts)
      require("kulala").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "http", "rest" },
        callback = function()
          vim.keymap.set("n", "<c-n>", function()
            require("kulala").jump_next()
            vim.cmd "normal! zz"
          end, { buffer = true })
          vim.keymap.set("n", "<c-p>", function()
            require("kulala").jump_prev()
            vim.cmd "normal! zz"
          end, { buffer = true })
          vim.keymap.set("n", "<c-a>", function()
            require("kulala").run_all()
          end, { buffer = true })
        end,
      })
    end,
  },
}
