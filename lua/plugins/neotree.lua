return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "adelarsq/image_preview.nvim",
      config = true,
    },
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
  },
  config = function()
    local icon = require "eduardo.icons"
    require("neo-tree").setup {
      close_if_last_window = true,
      popup_border_style = "single",
      enable_modified_markers = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = icon.ui.Folder,
          folder_open = icon.ui.FolderOpen,
          folder_empty = icon.ui.FolderEmpty,
          folder_empty_open = icon.ui.FolderEmptyOpen,
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      commands = {
        image_wezterm = function(state)
          local node = state.tree:get_node()
          if node.type == "file" then
            require("image_preview").PreviewImage(node.path)
          end
        end,
      },
      window = {
        position = "float",
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<A-h>"] = "navigate_up",
          ["<A-l>"] = "set_root",
          ["<leader>p"] = "image_wezterm",
          ["<leader>"] = {
            "toggle_node",
            nowait = false,
          },
          ["l"] = "open",
          ["h"] = "open",
          ["<esc>"] = "revert_preview",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["o"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["a"] = {
            "add",
            config = {
              show_path = "none",
            },
          },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = {
            "move",
            config = {
              show_path = "relative",
            },
          },
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<S-Tab>"] = "prev_source",
          ["<Tab>"] = "next_source",
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "   Files " },
          { source = "buffers", display_name = "   Bufs " },
          { source = "git_status", display_name = "   Git " },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd "wincmd ="
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd "wincmd ="
            end
          end,
        },
      },
    }

    require("nvim-web-devicons").setup {
      override_by_extension = {
        ["http"] = {
          icon = "󰖟",
          color = "#4d80ff",
          name = "http",
        },
      },
      override_by_filename = {
        [".luacheckrc"] = {
          icon = "",
          color = "#69a6ff",
          name = ".luacheckrc",
        },
      },
    }
  end,
}
