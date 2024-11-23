local wezterm = require "wezterm"
local act = wezterm.action

local powershell = "U:\\Applications\\Scoop\\apps\\pwsh\\current\\pwsh.exe"
local arch = "C:\\Users\\eduar\\AppData\\Local\\Microsoft\\WindowsApps\\arch.exe"

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { powershell }
-- config.default_prog = { arch }

-- config.colors = require("cyberdream")
config.color_scheme = "Poimandres"
config.line_height = 1.0
config.cell_width = 1.1
config.font = wezterm.font_with_fallback {
  { family = "DankMono Nerd Font", scale = 1.00 },
  -- { family = "JetBrainsMono Nerd Font", scale = 1.00 },
}
config.font_size = 14
config.window_background_opacity = 1.00
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.disable_default_key_bindings = true
config.hide_tab_bar_if_only_one_tab = true
config.front_end = "OpenGL"
config.default_cursor_style = "SteadyBar"

config.inactive_pane_hsb = {
  saturation = 0.50,
  brightness = 0.6,
}

config.leader = { key = "o", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "a", mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c", mods = "LEADER", action = act.ActivateCopyMode },
  -- "phys:Space" <- key "space"
  { key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },

  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },
  { key = "c", mods = "LEADER", action = act.CopyTo "ClipboardAndPrimarySelection" },

  { key = "Tab", mods = "CTRL|SHIFT", action = act { ActivateTabRelative = -1 } },
  { key = "Tab", mods = "CTRL", action = act { ActivateTabRelative = 1 } },

  { key = "s", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "v", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
  { key = "q", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "o", mods = "LEADER", action = act.RotatePanes "Clockwise" },
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable { name = "resize_pane", one_shot = false },
  },

  { key = "t", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "n", mods = "LEADER", action = act.ShowTabNavigator },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Blue" } },
        { Text = "Renaming Tab Title...:" },
      },
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  { key = "m", mods = "LEADER", action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
  { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

  { key = "w", mods = "LEADER", action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
  { key = "f", mods = "LEADER", action = act.Search { CaseSensitiveString = "" } },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom "Clipboard",
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j", action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k", action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l", action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
    { key = "Enter", action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h", action = act.MoveTabRelative(-1) },
    { key = "j", action = act.MoveTabRelative(-1) },
    { key = "k", action = act.MoveTabRelative(1) },
    { key = "l", action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
    { key = "Enter", action = "PopKeyTable" },
  },
}

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
