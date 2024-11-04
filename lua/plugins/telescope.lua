return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  lazy = true,
  keys = {
    {
      "<leader>fc",
      "<cmd>Telescope colorscheme<cr>",
      desc = "Colorscheme",
    },
    {
      "<leader>fn",
      "<cmd>Telescope notify<cr>",
      desc = "notify",
    },
    {
      "<leader>fm",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
    },
    {
      "<leader><leader>",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files",
    },
    {
      "<leader>fw",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Word",
    },
    {
      "<leader>fo",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Find Recent",
    },
    {
      "<leader>fB",
      "<cmd>Telescope builtin<cr>",
      desc = "Builtin",
    },
    {
      "<leader>fb",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "File browser",
    },
    {
      "<leader>fd",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Find Diagnostics",
    },
    {
      "<leader>fp",
      "<cmd>Telescope project<cr>",
      desc = "Find Project",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    local icon = require "eduardo.icons"

    telescope.setup {
      defaults = {
        path_display = { "filename_first" },
        file_ignore_patterns = {
          "node_modules/*",
          "yarn.lock",
          "bun.lockb",
          "package-lock.json",
          "lazy-lock.json",
          "target/*",
          ".git/*",
        },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.close,
            ["<C-e>"] = actions.select_default,
            ["<A-j>"] = actions.preview_scrolling_down,
            ["<A-k>"] = actions.preview_scrolling_up,
          },
        },
        prompt_prefix = icon.ui.Telescope .. " ",
        selection_caret = icon.ui.BoldArrowRight .. " ",
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 160,
          vertical = {
            mirror = true,
          },
        },
      },
      pickers = {
        find_files = {
          previewer = true,
          theme = "dropdown",
        },
        colorscheme = {
          enable_preview = true,
          previewer = false,
        },
        live_grep = {
          only_sord_text = true,
          theme = "dropdown",
        },
        oldfiles = {
          previewer = false,
        },
        builtin = {
          previewer = true,
          theme = "dropdown",
        },
        buffers = {
          mappings = {
            i = {
              ["<M-d>"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        file_browser = {
          mappings = {
            ["i"] = {
              ["<C-w>"] = { "<c-s-w>", type = "command" },
              ["<C-h>"] = false,
            },
          },
          theme = "dropdown",
          hidden = true,
          previewer = true,
        },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    vim.cmd [[highlight TelescopeSymbolKind guifg=#61AFEF]]

    require("telescope").load_extension "project"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "notify"
  end,
}
