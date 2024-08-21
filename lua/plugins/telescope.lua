return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  lazy = true,
  keys = {
    {
      "<leader>fc",
      function()
        require("telescope.builtin").colorscheme { enable_preview = true }
      end,
      desc = "Colorscheme",
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "notify",
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files { hidden = true }
      end,
      desc = "Find Files",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find Word",
    },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Find Recent",
    },
    {
      "<leader>fB",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Builtin",
    },
    {
      "<leader>fb",
      function()
        require("telescope").extensions.file_browser.file_browser { path = "%:h:p", select_buffer = true }
      end,
      desc = "File browser",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Find Diagnostics",
    },
    {
      "<leader>fp",
      function()
        require("telescope").extensions.project.project()
      end,
      desc = "Find Project",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    -- "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    local icon = require "eduardo.icons"

    telescope.setup {
      -- path_display = { "filename_first" },
      defaults = {
        file_ignore_patterns = {
          "node_modules/.*",
          "%.env",
          "yarn.lock",
          "package-lock.json",
          "lazy-lock.json",
          "init.sql",
          "target/.*",
          ".git/.*",
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
          preview_cutoff = 120,
          vertical = {
            mirror = true,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          -- "--glob=!.git/",
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
    require("telescope").load_extension "project"
    require("telescope").load_extension "file_browser"
    -- require("telescope").load_extension "ui-select"
    require("telescope").load_extension "notify"
  end,
}
