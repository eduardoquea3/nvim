return {
  "akinsho/bufferline.nvim",
  enabled = true,
  event = "User FileOpened",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_update_on_event = true,
        diagnostics_indicator = function(_, _, diagnostics_dict)
          local icons = { error = "", warning = "", info = "", hint = "󰉁" }
          local indicator = ""
          for severity, count in pairs(diagnostics_dict) do
            if count > 0 then
              indicator = indicator .. " " .. icons[severity] .. " " .. count
            end
          end
          return indicator
        end,
        indicator = {
          icon = "▎",
          style = "icon",
        },
        separator_style = "slant",
        buffer_close_icon = "󰅖",
        close_icon = "󰅖",
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_buffer_icons = true,
        color_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        always_show_bufferline = false,
        max_name_length = 24,
        tab_size = 18,
      },
      highlights = {
        fill = { bg = { attribute = "bg", highlight = "TabLine" } },
        background = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        buffer_visible = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        buffer_selected = {
          fg = { attribute = "fg", highlight = "Normal" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
          bold = true,
          italic = true,
        },
        separator = {
          fg = { attribute = "bg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
          fg = { attribute = "bg", highlight = "TabLineSel" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
        },
        indicator_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticInfo" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
        },
        modified = { fg = { attribute = "fg", highlight = "DiagnosticWarn" } },
        modified_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticWarn" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
        },
        close_button = { fg = { attribute = "fg", highlight = "TabLine" } },
        close_button_selected = {
          fg = { attribute = "fg", highlight = "DiagnosticError" },
          bg = { attribute = "bg", highlight = "TabLineSel" },
        },
      },
    }
  end,
}
