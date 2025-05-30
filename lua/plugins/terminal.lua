return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = {
      { "<M-1>", "<cmd>ToggleTerm direction=horizontal<cr>", mode = { "n", "t" }, desc = "Open Terminal" },
      {
        "<M-2>",
        "<cmd>ToggleTerm direction=vertical size=70<cr>",
        mode = { "n", "t" },
        desc = "Open Terminal",
      },
      {
        "<A-m>",
        "<cmd>exe v:count . 'ToggleTerm direction=horizontal'<cr>",
        mode = { "n", "t" },
        desc = "Open Terminal",
      },
    },
    config = function()
      require("toggleterm").setup {
        size = 20,
        -- open_mapping = [[<a-m>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = "bash",
        float_opts = {
          border = "rounded",
          winblend = 0,
          width = function()
            return math.floor(vim.o.columns * 0.7)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.7)
          end,
        },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    event = "User FileOpened",
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      vim.g.lazygit_floating_window_use_plenary = 0
      vim.g.lazygit_use_neovim_remote = 1
      vim.g.lazygit_use_custom_config_file_path = 0
      vim.g.lazygit_config_file_path = ""
    end,
  },
}
