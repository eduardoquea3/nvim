return {
  "b0o/incline.nvim",
  enabled = true,
  event = "User FileOpened",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local devicons = require "nvim-web-devicons"
    local incline = require "incline"
    local helpers = require "incline.helpers"

    incline.setup {
      hide = {
        only_win = false,
      },
      window = {
        padding = 0,
        margin = { horizontal = 2, vertical = 2 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { removed = " ", changed = " ", added = " " }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { "| " })
          end
          return labels
        end

        local function get_diagnostic_label()
          local icons = { error = "", warn = "", info = "", hint = "󰉁" }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { "| " })
          end
          return label
        end

        local function get_file_name()
          local label = {}
          table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
          table.insert(label, { vim.bo[props.buf].modified and " " or "", guifg = "#d19a66" })
          table.insert(label, { filename, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" })
          if not props.focused then
            label["group"] = "BufferInactive"
          end

          return label
        end

        return {
          { "", guifg = "#1b1f27", guibg = "none" },
          {
            { get_diagnostic_label() },
            { get_git_diff() },
            { get_file_name() },
            guibg = "#1b1f27",
          },
          { "", guifg = "#1b1f27", guibg = "none" },
        }
      end,
    }
  end,
}
