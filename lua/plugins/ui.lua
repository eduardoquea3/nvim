return {
  {
    "folke/noice.nvim",
    -- event = "User FileOpened",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = { enabled = false },
        signature = {
          opts = {
            size = {
              width = 40,
              height = 15,
            }
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          local notify = require "notify"
          notify.setup {
            fps = 60,
            -- background_colour = "NormalFloat",
            top_down = false,
            render = "minimal",
            stages = "fade",
            timeout = 1000,
            max_height = function()
              return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
              return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
              vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
          }
          vim.notify = notify
        end,
      },
    },
  },
}
