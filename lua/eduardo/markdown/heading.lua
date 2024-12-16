local headings = {
  enable = true,

  shift_width = 1,

  heading_1 = {
    style = "icon",

    hl = "MarkviewHeading1",

    sign = "󰌕 ",

    sign_hl = "MarkviewHeading1Sign",
  },
  heading_2 = {
    style = "icon",

    hl = "MarkviewHeading2",

    shift_char = " ",

    shift_hl = "MarkviewHeading2Sign",

    sign = "󰌕 ",

    sign_hl = "MarkviewHeading2Sign",

    -- icon = "󰼏  ",

    icon_hl = "MarkviewHeading2",
  },
  heading_3 = {
    style = "icon",

    -- align = "center",

    hl = "MarkviewHeading3",

    -- corner_left = "",

    -- padding_left = " ",

    -- padding_right = " ",

    -- corner_right = "",

    corner_left_hl = "MarkviewHeading3Sign",
    -- padding_left_hl = nil,

    ---@type string?
    -- padding_right_hl = nil,
    ---@type string?
    corner_right_hl = "MarkviewHeading3Sign",

    --- Text to show on the signcolumn.
    ---@type string?
    sign = "󰌕 ",

    --- Highlight group for the sign.
    ---@type string?
    sign_hl = "MarkviewHeading3Sign",

    --- Icon to show before the heading text.
    ---@type string?
    -- icon = "",

    --- Highlight group for the Icon.
    ---@type string?
    icon_hl = "MarkviewHeading3",
  },
  heading_4 = {},
  heading_5 = {},
  heading_6 = {},

  setext_1 = {
    style = "simple",

    --- Background highlight group.
    ---@type string
    hl = "MarkviewHeading1",
  },
  setext_2 = {
    style = "decorated",

    --- Text to show on the signcolumn.
    ---@type string?
    sign = "󰌕 ",

    --- Highlight group for the sign.
    ---@type string?
    sign_hl = "MarkviewHeading2Sign",

    --- Icon to show before the heading text.
    ---@type string?
    icon = "  ",

    --- Highlight group for the Icon.
    ---@type string?
    icon_hl = "MarkviewHeading2",

    --- Bottom border for the heading.
    ---@type string?
    border = "▂",

    --- Highlight group for the bottom border.
    ---@type string?
    border_hl = "MarkviewHeading2",
  },
}
return headings
